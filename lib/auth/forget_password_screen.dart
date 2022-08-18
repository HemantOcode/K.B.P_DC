import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/auth/change_password_screen.dart';
import 'package:flutter_application_1/auth/providers/auth_provider.dart';
import 'package:flutter_application_1/home/events/text_styles.dart';
import 'package:provider/provider.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneEmailController = TextEditingController();
  TextEditingController otpEditingController = TextEditingController();
  FocusNode phoneEmailNode = FocusNode();

  bool lockphoneEmailInput = true;
  bool isLoading = false;
  bool finduser = false;
  String displayMessage = '';
  String verificationIdFirebase = '';
  String invalidOTP = '';
  String userFoundAndNot = '';
  String phoneNumber = '';

  getUserDetails() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      final user =
          await Provider.of<AuthProvider>(context, listen: false)
              .getUserDetails(query: phoneEmailController.text);

      if (!user['success']) {
        setState(() {
          userFoundAndNot = 'User with this credentials does not exits';
          isLoading = false;
        });
        return;
      }
      if (user['success']) {
        phoneEmailNode.unfocus();
        phoneNumber = user['result']['phone'];
        FirebaseAuth _auth = FirebaseAuth.instance;
        _auth.verifyPhoneNumber(
          phoneNumber: '+91' + "${user['result']['phone']}",
          // phoneNumber: '+917021197280',
          verificationCompleted: (PhoneAuthCredential credential) {
            print(credential);
          },
          verificationFailed: (FirebaseAuthException e) {
            print(e);
            verificationIdFirebase = '';
          },
          codeSent: (String verificationId, int? resendToken) {
            print("Verification Id:" + verificationId);
            print(resendToken);
            setState(() {
              verificationIdFirebase = verificationId;
              lockphoneEmailInput = false;
            });
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            print(verificationId);
          },
        );
      }
      setState(() {
        isLoading = false;
        

      });
    }
  }

  verifyOTP() async {
    PhoneAuthCredential user = PhoneAuthProvider.credential(
        verificationId: verificationIdFirebase,
        smsCode: otpEditingController.text);

    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.signInWithCredential(user).then((value) {
      print(value);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChanegPasswordScreen(phone:phoneNumber),
        ),
      );
    }).catchError((error) {
      print(error);
      setState(() {
        invalidOTP = 'You entered invalid OTP';
      });
    });
  }

  unlockTextFormFeild() {
    setState(() {
      lockphoneEmailInput = true;
      verificationIdFirebase = '';
      phoneNumber ='';
    });
  }

  @override
  Widget build(BuildContext context) {
    final dW = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password',
            style:
                TextStyle(fontSize: headline4.toDouble(), letterSpacing: .56)),
      ),
      body: SafeArea(
          maintainBottomViewPadding: true,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: dW * 0.05, vertical: dW * 0.08),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    enabled: lockphoneEmailInput,
                    focusNode: phoneEmailNode,
                    controller: phoneEmailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.trim() == '') {
                        return 'Please Enter Mobile Number or E-mail';
                      }
                    },
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: headline4.toDouble(),
                        letterSpacing: .56),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: headline6.toDouble()),
                      hintText: 'Email, Mobile Number',
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Text(
                      userFoundAndNot,
                      style: const TextStyle(
                          fontSize: 14.5, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: dW * 0.03),
                      child: isLoading
                          ? LinearProgressIndicator()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(displayMessage),
                                if (!lockphoneEmailInput)
                                  TextButton(
                                      onPressed: () {
                                        unlockTextFormFeild();
                                      },
                                      child: Text('Edit'))
                              ],
                            )),
                  SizedBox(
                    width: double.infinity,
                    height: dW * 0.12,
                    child: ElevatedButton(
                      onPressed: () {
                        getUserDetails();
                      },
                      child: const Text('Reset Password'),
                    ),
                  ),
                  if (verificationIdFirebase != '')
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: dW * 0.05, bottom: dW * 0.025),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: otpEditingController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.trim() == '') {
                                return 'Please Enter OTP';
                              }
                            },
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: headline4.toDouble(),
                                letterSpacing: .56),
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: headline6.toDouble()),
                              hintText: 'Enter OTP',
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          child: Text(
                            invalidOTP,
                            style:
                                TextStyle(color: Theme.of(context).errorColor),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              verifyOTP();
                            },
                            child: Text('Verify OTP')),
                      ],
                    )
                ],
              ),
            ),
          )),
    );
  }
}
