// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController textController;
  final TextInputType textInputType;
  final String hintText;
  final bool isPassword;
  final IconData prefixIcon;
  bool obscureText;
  CustomTextField({
    super.key,
    required this.textController,
    required this.textInputType,
    required this.hintText,
    required this.prefixIcon,
    required this.obscureText,
    this.isPassword = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border = const OutlineInputBorder(
      borderSide: BorderSide(color: mainColor),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        controller: widget.textController,
        keyboardType: widget.textInputType,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          labelText: widget.hintText,
          border: border,
          enabledBorder: border,
          focusedBorder: border,
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      widget.obscureText = !widget.obscureText;
                    });
                  },
                  icon: widget.obscureText
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                )
              : null,
          prefixIcon: Icon(widget.prefixIcon),
        ),
      ),
    );
  }
}
