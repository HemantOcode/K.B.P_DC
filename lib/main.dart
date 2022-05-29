import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth/providers/auth_provider.dart';
import 'package:flutter_application_1/auth/splash_screen.dart';
import 'package:flutter_application_1/home/acadmics/acadmic_provider.dart';
import 'package:flutter_application_1/home/events/event_provider.dart';
import 'package:flutter_application_1/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  importance: Importance.max,
);

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> backgroundHandler(RemoteMessage message) async {
  debugPrint(message.notification!.body.toString());
  debugPrint(message.notification!.title);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  String? fcmToken = await FirebaseMessaging.instance.getToken();
  runApp(const KBP());
}

class KBP extends StatefulWidget {
  const KBP({Key? key}) : super(key: key);

  @override
  State<KBP> createState() => _KBPState();
}

class _KBPState extends State<KBP> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => EventProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AcadmicProvider(),
        ),
        // AcadmicProvider
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.purple,
          // colorScheme: const ColorScheme(
          //     brightness: Brightness.dark,
          //     primary: Colors.purple,
          //     onPrimary: Colors.blue,
          //     secondary: Colors.cyan,
          //     onSecondary: Colors.deepPurple,
          //     error: Colors.red,
          //     onError: Colors.redAccent,
          //     background: Colors.white,
          //     onBackground: Colors.blueGrey,
          //     surface: Colors.lightBlue,
          //     onSurface: Colors.purpleAccent),
        ),
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
