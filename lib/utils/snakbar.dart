import 'package:flutter/material.dart';

snackBarMessenger({required BuildContext context,required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}
