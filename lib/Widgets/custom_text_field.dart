import 'package:flutter/material.dart';
import 'package:sample/Utils/constants.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String errorText;
  final TextEditingController controller;

  const CustomTextField(
      {super.key,
      required this.labelText,
      required this.errorText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: primaryColor, // Set the border color
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            width: 2.5, // Set the border thickness
            color: primaryColor, // Set the border color
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        hintText: labelText,
        labelText: labelText,
        alignLabelWithHint: true,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return errorText;
        }
        return null;
      },
    );
  }
}
