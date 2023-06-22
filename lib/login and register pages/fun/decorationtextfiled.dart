import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class textfield extends StatelessWidget {
  textfield(
      {super.key,
      required this.hint,
      required this.controller,
      required this.obscure,
      this.keyboardtype,
      this.maxlenght});
  String hint;
  TextEditingController controller;
  bool obscure;
  TextInputType? keyboardtype;
  int? maxlenght;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        keyboardType: keyboardtype,
        obscureText: obscure,
        controller: controller,
        maxLength: maxlenght,
        decoration: InputDecoration(
            hintText: hint,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            fillColor: Color.fromARGB(255, 255, 255, 255),
            filled: true),
      ),
    );
  }
}
