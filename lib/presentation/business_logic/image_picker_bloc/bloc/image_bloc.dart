import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../data/utils/image_picker_utils.dart';
import 'image_state.dart';


part 'image_event.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  // This is dependency injection we pass our util class to bloc as dependecy inject.
  final ImagePickerUtils imagePickerUtils;
  
  ImageBloc(this.imagePickerUtils) : super(ImageState()) {
    on<CameraCapture>(_cameraCapture);
    on<GalleryImagePicker>(_pickImageFromGallery);
  }
  void _cameraCapture(CameraCapture event, Emitter<ImageState> states)async{
    XFile? file = await imagePickerUtils.cameraCaptureFunc();
    emit(state.copyWith(file: file));
  }

  void _pickImageFromGallery(GalleryImagePicker event, Emitter<ImageState> states)async{
    XFile? file = await imagePickerUtils.pickImageFromGalleryFunc();
    emit(state.copyWith(file: file));
  }
}
