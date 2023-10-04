import 'package:image_picker/image_picker.dart';

class ImagePick {
  Future<dynamic> selectImage(ImageSource source) async {
    final _pickImage = ImagePicker();

    XFile? _image = await _pickImage.pickImage(source: source);

    if (_image != null) {
      return _image.readAsBytes();
    }
    print("image not selected");
  }
}
