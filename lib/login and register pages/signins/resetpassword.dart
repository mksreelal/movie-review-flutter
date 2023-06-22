import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/login%20and%20register%20pages/fun/decorationtextfiled.dart';
import 'package:myapp/login%20and%20register%20pages/fun/submit.dart';

//reset password
class ScreenReset extends StatefulWidget {
  const ScreenReset({super.key});

  @override
  State<ScreenReset> createState() => _ScreenResetState();
}

class _ScreenResetState extends State<ScreenReset> {
  final _email = TextEditingController();

  Future resetpassword(context) async {
    final email = _email.text;
    if (email.contains('@')) {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(seconds: 3),
          backgroundColor: const Color.fromARGB(255, 6, 157, 21),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(10.0),
          content: Text('Reset Email has been send to $email')));
      Navigator.of(context).pushNamed('login');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: Color.fromARGB(255, 238, 103, 94),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10.0),
          content: Text('Enter correct Email')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 221, 221, 221),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Icon(
                Icons.restore,
                size: 100,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Get Back Your Account',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              textfield(
                hint: 'Enter Email',
                controller: _email,
                obscure: false,
              ),
              const SizedBox(
                height: 30,
              ),
              Submit(
                ontap: () {
                  resetpassword(context);
                },
                text: 'Send Mail',
              )
            ],
          ),
        ),
      ),
    );
  }
}
