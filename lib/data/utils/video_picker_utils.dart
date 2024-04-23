import 'package:image_picker/image_picker.dart';

class VideoPickerUtils {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> cameraCaptureVideoFunc() async {
    final XFile? file = await _picker.pickVideo(source: ImageSource.camera);
    return file;
  }

  Future<XFile?> gallerSelectVideoFunc() async {
    final XFile? file = await _picker.pickVideo(source: ImageSource.gallery);
    return file;
  }




}
