import 'package:image_picker/image_picker.dart';

abstract class CameraService {
  static Future<XFile?> getImageGallery() async {
    XFile? image;
    ImagePicker? picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1000,
      maxHeight: 1000,
    );
    if (pickedFile == null) return null;
    image = pickedFile;
    return image;
  }

  static Future<XFile?> takePhoto() async {
    XFile? image;
    ImagePicker? picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1000,
      maxHeight: 1000,
    );
    if (pickedFile == null) return null;
    image = pickedFile;
    return image;
  }
}
