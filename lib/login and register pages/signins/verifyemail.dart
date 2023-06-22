import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/screenhome.dart';

//verify email

class VerifyEmail extends StatefulWidget {
  VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool isEmailVerified = false;
  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationmail();
    }
  }

  Future sendVerificationmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: Color.fromARGB(255, 238, 103, 94),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10.0),
          content: Text("Error Occured Try Again")));
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? const ScreenHome()
      : Scaffold(
          body: Container(
            color: Colors.transparent.withOpacity(0.5),
            child: const Text(
              'heooooo',
              style: TextStyle(fontSize: 1000),
            ),
          ),
        );
}
