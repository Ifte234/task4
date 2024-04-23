import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';

class AudioPickerUtils{
  // AudioPlayer audioPlayer = AudioPlayer();
  // final audioPicker = FilePicker.platform.pickFiles();
  Future<File> audiopicker()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();

      File file = File(result!.files.single.path!);

      // User canceled the picker

    return file;
  }

}