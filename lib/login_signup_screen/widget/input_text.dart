import 'package:flutter/material.dart';

const redcolor = Color(0xFFBF1E2E);

// ignore: must_be_immutable
class InputTextField extends StatelessWidget {
  String labelText;
  IconData iconData;
  TextEditingController controller;

  InputTextField({
    Key? key,
    required this.labelText,
    required this.iconData,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: redcolor),
        ),
        prefixIcon: Icon(
          iconData,
          color: redcolor,
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
