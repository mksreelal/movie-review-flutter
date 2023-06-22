import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/login%20and%20register%20pages/fun/decorationtextfiled.dart';
import 'package:myapp/login%20and%20register%20pages/fun/submit.dart';
import 'package:myapp/pages/screenhome.dart';
import 'package:myapp/utiles/text.dart';

//phone sign in

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({Key? key});

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

final _phonenumber = TextEditingController();
final _otpcontroller = TextEditingController();
String? user;
String verificationID = '';
bool otpvisibility = false;

class _PhoneLoginState extends State<PhoneLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 221, 221, 221),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  const Icon(
                    Icons.phone,
                    size: 100,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const ModifiesText(
                    text: 'Phone Verification',
                    size: 25,
                    color: Color.fromARGB(255, 122, 122, 122),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const ModifiesText(
                    text: 'We need to verify your number before started',
                    size: 14,
                    color: Color.fromARGB(255, 122, 122, 122),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: textfield(
                      keyboardtype: TextInputType.number,
                      hint: 'Phone Number',
                      controller: _phonenumber,
                      obscure: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8),
                    child: Visibility(
                      visible: otpvisibility,
                      child: textfield(
                        keyboardtype: TextInputType.number,
                        hint: '6 digit OTp',
                        controller: _otpcontroller,
                        obscure: false,
                        maxlenght: 6,
                      ),
                    ),
                  ),
                  Submit(
                      ontap: () {
                        loginwithphone();
                        verifyOTP();
                      },
                      text: 'Send OTP'),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('logins');
                    },
                    child: Submit(
                      ontap: () {
                        Navigator.of(context).pop();
                      },
                      text: 'Cancel',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loginwithphone() async {
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91${_phonenumber.text}',
      verificationCompleted: (phoneAuthCredential) async {
        await FirebaseAuth.instance
            .signInWithCredential(phoneAuthCredential as AuthCredential)
            .then((value) {});
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (verificationId, forceResendingToken) {
        verificationID = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationID,
      smsCode: _otpcontroller.text,
    );

    await FirebaseAuth.instance.signInWithCredential(credential).then(
      (value) {
        setState(() {
          user = FirebaseAuth.instance.currentUser?.uid;
        });
      },
    ).whenComplete(
      () {
        if (user != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 3),
              backgroundColor: Color.fromARGB(255, 6, 157, 21),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.all(10.0),
              content: Text('you logged in successfully '),
            ),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenHome(),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 3),
              backgroundColor: Color.fromARGB(255, 6, 157, 21),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.all(10.0),
              content: Text('login failed'),
            ),
          );
        }
      },
    );
  }
}
