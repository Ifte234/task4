part of 'video_picker_bloc.dart';

class VideoPickerState extends Equatable {
  final XFile? file;
  const VideoPickerState({this.file});

  VideoPickerState copyWith({ XFile? file}){
    return VideoPickerState(
      file: file ?? this.file
    );
  }
  
  @override
  List<Object?> get props => [file];
}
