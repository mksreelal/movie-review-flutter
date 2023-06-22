import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/login%20and%20register%20pages/signins/phonelogin.dart';
import 'package:myapp/login%20and%20register%20pages/signins/resetpassword.dart';
import 'package:myapp/pages/screenhome.dart';
import 'package:myapp/login%20and%20register%20pages/screenLogin.dart';
import 'package:myapp/login%20and%20register%20pages/screenregister.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenLogin(),

      //routes
      routes: {
        'register': (context) => ScreenRegister(),
        'login': (context) => ScreenLogin(),
        'home': (context) => ScreenHome(),
        'forgotpassword': (context) => ScreenReset(),
        'phonelogin': (context) => PhoneLogin(),
      },
    );
  }
}
