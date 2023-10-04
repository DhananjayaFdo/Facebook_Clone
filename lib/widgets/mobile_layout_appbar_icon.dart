// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppbarIconButton extends StatelessWidget {
  Function()? function;
  String icon;
  CustomAppbarIconButton({
    super.key,
    required this.function,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.1),
          borderRadius: BorderRadius.circular(50),
        ),
        child: SvgPicture.asset(icon, width: 20),
      ),
    );
  }
}
