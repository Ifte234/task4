import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../data/utils/video_picker_utils.dart';

part 'video_picker_event.dart';
part 'video_picker_state.dart';

class VideoPickerBloc extends Bloc<VideoPickerEvent, VideoPickerState> {
  final VideoPickerUtils _videoPickerUtils;
  VideoPickerBloc(this._videoPickerUtils) : super(VideoPickerState()) {
    on<CameraEvent> (_onVideoPickerevent);
    on<GalleryPickerEvent>(_onGalleryPickerEvent);



  }
  _onVideoPickerevent(CameraEvent event,Emitter<VideoPickerState> states)async{
    XFile? file = await _videoPickerUtils.cameraCaptureVideoFunc();
    emit(state.copyWith(file:file));

  }

  _onGalleryPickerEvent(GalleryPickerEvent event,Emitter<VideoPickerState> states) async {
    XFile? file = await _videoPickerUtils.gallerSelectVideoFunc();
    emit(state.copyWith(file: file));
  }
}
