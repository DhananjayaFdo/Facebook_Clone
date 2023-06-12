// ignore_for_file: must_be_immutable

import 'package:facebook_clone/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSmallText extends StatelessWidget {
  final String text;
  Color textColor;
  final double fontSize;
  bool fontBold;
  CustomSmallText({
    super.key,
    required this.text,
    this.textColor = whiteColor,
    this.fontSize = 15,
    this.fontBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontBold ? FontWeight.bold : null,
      ),
    );
  }
}
