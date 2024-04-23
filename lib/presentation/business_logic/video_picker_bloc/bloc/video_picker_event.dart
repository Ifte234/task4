part of 'video_picker_bloc.dart';

abstract class VideoPickerEvent extends Equatable {
  const VideoPickerEvent();

  @override
  List<Object> get props => [];
}
class CameraEvent extends VideoPickerEvent{}
class GalleryPickerEvent extends VideoPickerEvent{}