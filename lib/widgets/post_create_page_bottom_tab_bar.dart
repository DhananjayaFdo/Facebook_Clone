// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostCreatePageBottom extends StatelessWidget {
  String image;
  Function()? function;
  PostCreatePageBottom({
    super.key,
    required this.image,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: function,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            image,
            width: 30,
          ),
        ),
      ),
    );
  }
}
