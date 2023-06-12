import 'package:flutter/material.dart';

class CustomGreyDivider extends StatelessWidget {
  const CustomGreyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: double.infinity,
      color: Colors.grey.withOpacity(0.15),
    );
  }
}
