import 'package:flutter/material.dart';
import 'package:sample/Utils/constants.dart';

class CustomText extends StatelessWidget {
  final String value;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  final String? fontFamily;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final TextDecoration? decoration;

  const CustomText(
      {super.key,
      required this.value,
      this.size,
      this.fontWeight,
      this.color,
      this.fontFamily,
      this.textAlign,
      this.letterSpacing,
      this.decoration});

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: size,
          color: color ?? black,
          decoration: decoration,
          fontWeight: fontWeight,
          fontFamily: fontFamily,
          letterSpacing: letterSpacing),
    );
  }
}
