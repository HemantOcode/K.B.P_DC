import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/auth/login_screen.dart';
import 'package:flutter_application_1/auth/providers/auth_provider.dart';
import 'package:flutter_application_1/commanFunction/comman_functions.dart';
import 'package:provider/provider.dart';

class ChanegPasswordScreen extends StatefulWidget {
  const ChanegPasswordScreen({Key? key, required this.phone}) : super(key: key);
  final String phone;

  @override
  State<ChanegPasswordScreen> createState() => _ChanegPasswordScreenState();
}

class _ChanegPasswordScreenState extends State<ChanegPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  changePassWord() async {
    if (_formKey.currentState!.validate()) {
      final response = await Provider.of<AuthProvider>(context, listen: false)
          .changeUserPassWord(
              phone: widget.phone, password: confirmPasswordController.text);
      if (response) {
        successSnackbar(context, 'Your password has be reset');
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false);
      }
      errorSnackbar(context, 'Failed to reset your password, Try again later');
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dW = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Set new password'),
        leadingWidth: dW * 0.08,
      ),
      body: SafeArea(
          maintainBottomViewPadding: true,
          child: Container(
            padding: EdgeInsets.all(dW * 0.05),
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value != confirmPasswordController.text) {
                      return 'Password not matched';
                    }
                    if (value!.trim() == '') {
                      return " Password can't be blank ";
                    }
                    if (value.trim().length < 6) {
                      return " Password must be 6 Character long";
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: 'Set New Password',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                    ),
                  ),
                ),
                SizedBox(
                  height: dW * 0.08,
                ),
                TextFormField(
                  validator: (value) {
                    if (value != passwordController.text) {
                      return 'Password not matched';
                    }

                    if (value!.trim() == '') {
                      return " Password can't be blank ";
                    }
                    if (value.trim().length < 6) {
                      return " Password must be 6 Character long";
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: 'Confirm New Password',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                    ),
                  ),
                ),
                SizedBox(
                  height: dW * 0.1,
                ),
                SizedBox(
                  height: dW * 0.12,
                  width: double.infinity,
                  child: ElevatedButton(
                    child: const Text(
                      'Change Password',
                      style: TextStyle(
                          letterSpacing: .56, fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          )),
    );
  }
}
