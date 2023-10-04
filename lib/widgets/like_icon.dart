// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class CustomSection extends StatelessWidget {
  String icon;
  String label;
  bool fontWeight;
  Function()? function;
  CustomSection({
    super.key,
    required this.icon,
    required this.label,
    this.fontWeight = false,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            width: 25,
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: fontWeight ? FontWeight.bold : null,
            ),
          ),
        ],
      ),
    );
  }
}
