import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/login%20and%20register%20pages/fun/assetspath.dart';
import 'package:myapp/login%20and%20register%20pages/fun/decorationtextfiled.dart';
import 'package:myapp/login%20and%20register%20pages/fun/otherlogin.dart';

import 'package:myapp/login%20and%20register%20pages/signins/googlesignin.dart';
import 'package:myapp/login%20and%20register%20pages/signins/verifyemail.dart';

import 'fun/submit.dart';

class ScreenRegister extends StatefulWidget {
  const ScreenRegister({super.key});

  @override
  State<ScreenRegister> createState() => _ScreenRegisterState();
}

class _ScreenRegisterState extends State<ScreenRegister> {
  final _usernamecontroller = TextEditingController();

  final _passwordcontroller = TextEditingController();

  final _confimcontroller = TextEditingController();
  // @override
  // void dispose() {
  //   _usernamecontroller.dispose();
  //   _passwordcontroller.dispose();
  //   super.dispose();
  // }

  Future signinuser() async {
    final password = _passwordcontroller.text;
    final confirmpassword = _confimcontroller.text;
    if (password == confirmpassword) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _usernamecontroller.text.trim(),
          password: _passwordcontroller.text.trim(),
        );
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            duration: Duration(seconds: 3),
            backgroundColor: Color.fromARGB(255, 238, 103, 94),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(10.0),
            content: Text('Try Again ')));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: Color.fromARGB(255, 238, 103, 94),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10.0),
          content: Text('Password Doesnot Match')));
    }
  }

  // @override
  // void initState() {
  //   _usernamecontroller.dispose();
  //   _passwordcontroller.dispose();
  //   _confimcontroller.dispose();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 221, 221, 221),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Center(
              child: Icon(
                Icons.app_registration,
                size: 100,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 40,
            ),
            textfield(
              obscure: false,
              hint: 'Email',
              controller: _usernamecontroller,
            ),
            textfield(
              obscure: true,
              hint: 'Password',
              controller: _passwordcontroller,
            ),
            textfield(
                hint: 'Confirm Password',
                controller: _confimcontroller,
                obscure: true),
            const Padding(
              padding: EdgeInsets.only(right: 16.0),
            ),
            const SizedBox(
              height: 10,
            ),
            Submit(
                text: 'Register',
                ontap: () {
                  signinuser();
                  VerifyEmail();
                }),
            const SizedBox(
              height: 25,
            ),
            const Row(
              children: [
                Expanded(
                    child: Divider(
                  thickness: 0.5,
                )),
                Text(
                  'or continue with',
                  style: TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 93, 93, 93)),
                ),
                Expanded(
                    child: Divider(
                  thickness: 0.5,
                ))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OtherLogin(
                  imagepath: google,
                  ontap: () {
                    authenticate().signInWithGoogle();
                  },
                ),
                const SizedBox(
                  width: 30,
                ),
                OtherLogin(
                  imagepath: phone,
                  ontap: () {
                    Navigator.of(context).pushNamed('phonelogin');
                  },
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have a account?',
                  style: TextStyle(color: Colors.grey[800]),
                ),
                const SizedBox(
                  width: 1,
                ),
                TextButton(
                  child: const Text(
                    ' Login',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () => back(context),
                )
              ],
            )
          ],
        )),
      ),
    );
  }

  void back(context) {
    Navigator.of(context).pushNamed('login');
  }
}
