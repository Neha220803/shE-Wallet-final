import 'package:flutter/material.dart';
import 'package:sample/Utils/constants.dart';
import 'package:sample/Widgets/Custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback? callback;

  final Size fixedSize;
  const CustomButton({
    super.key,
    required this.text,
    required this.callback,
    required this.color,
    required this.fixedSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          backgroundColor: color,
          foregroundColor: black,
          fixedSize: fixedSize,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        child: const CustomText(
          value: "Log In",
          color: white,
        ));
  }
}
