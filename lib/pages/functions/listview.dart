import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  MyListView();

  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ListView(
            children: [
              const DrawerHeader(
                child: CircleAvatar(
                  foregroundImage: NetworkImage(
                    'https://tse1.mm.bing.net/th?id=OIP.wBMp4cKdcuUYNQpa332M1QHaHl&pid=Api&P=0&h=180',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  ' Email :  ${user!.email!}',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 226, 23, 23)),
          ),
          onPressed: () => FirebaseAuth.instance.signOut(),
          child: const Text(
            'Logout',
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
      ],
    );
  }
}
