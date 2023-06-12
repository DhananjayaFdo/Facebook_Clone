import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<dynamic> customImagePicker(
    ImageSource source, BuildContext context) async {
  final _imagePick = ImagePicker();

  XFile? _image = await _imagePick.pickImage(source: source);

  if (_image != null) {
    return await _image.readAsBytes();
  } else {
    print("no image select");
  }
}
