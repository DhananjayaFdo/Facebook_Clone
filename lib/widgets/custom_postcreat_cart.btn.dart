// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomPostCartButton extends StatelessWidget {
  Function()? function;
  String icon;
  String text;
  CustomPostCartButton({
    super.key,
    required this.function,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              width: 10,
            ),
            const SizedBox(width: 3),
            Text(text),
            const SizedBox(width: 3),
            SvgPicture.asset(
              "assets/Icons/dropdown.svg",
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
