import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OtherLogin extends StatelessWidget {
  OtherLogin({super.key, required this.imagepath, required this.ontap});
  String imagepath;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200]),
        child: Image.asset(
          imagepath,
          height: 40,
        ),
      ),
    );
  }
}
