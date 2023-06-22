import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:myapp/login%20and%20register%20pages/fun/assetspath.dart';
import 'package:myapp/login%20and%20register%20pages/fun/decorationtextfiled.dart';
import 'package:myapp/login%20and%20register%20pages/signins/googlesignin.dart';
import 'package:myapp/login%20and%20register%20pages/fun/otherlogin.dart';
import 'package:myapp/login%20and%20register%20pages/fun/submit.dart';
import 'package:myapp/pages/screenhome.dart';

//login page

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> signInUser() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _usernameController.text.trim(),
        password: _passwordController.text.trim(),
      );
      const ScreenHome();
    } on FirebaseAuthException catch (e) {
      const errorMessage = 'Email and Password do not match';
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: Color.fromARGB(255, 238, 103, 94),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10.0),
          content: Text(errorMessage),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 221, 221, 221),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Center(
                child: Icon(
                  Icons.lock,
                  size: 100,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                "Welcome Back!!",
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 122, 122, 122),
                ),
              ),
              const SizedBox(height: 40),
              textfield(
                obscure: false,
                hint: 'Email',
                controller: _usernameController,
              ),
              textfield(
                obscure: true,
                hint: 'Password',
                controller: _passwordController,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('forgotpassword');
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forgot password ?'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Submit(
                text: 'LogIn',
                ontap: signInUser,
              ),
              const SizedBox(height: 25),
              const Row(
                children: [
                  Expanded(
                    child: Divider(thickness: 0.5),
                  ),
                  Text(
                    'or continue with',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 93, 93, 93),
                    ),
                  ),
                  Expanded(
                    child: Divider(thickness: 0.5),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OtherLogin(
                    ontap: () => authenticate().signInWithGoogle(),
                    imagepath: google,
                  ),
                  const SizedBox(width: 30),
                  OtherLogin(
                    imagepath: phone,
                    ontap: () {
                      Navigator.of(context).pushNamed('phonelogin');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[800]),
                  ),
                  const SizedBox(width: 5),
                  TextButton(
                    child: const Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () => reg(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void reg(BuildContext context) {
    Navigator.pushNamed(context, 'register');
  }
}
