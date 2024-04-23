import 'package:equatable/equatable.dart';

// part of 'audio_player_bloc.dart';

abstract class AudioPlayerState extends Equatable {
  const AudioPlayerState();

  @override
  List<Object> get props => [];
}

class AudioPlayerInitial extends AudioPlayerState {}

class GetAudioState extends AudioPlayerState {
  final String myfile;
  GetAudioState({required this.myfile});

  @override
  List<Object> get props => [myfile];
}

class AudioPlayingState extends AudioPlayerState {}
