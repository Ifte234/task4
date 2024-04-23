import 'package:equatable/equatable.dart';

// part of 'audio_player_bloc.dart';

abstract class AudioPlayerEvent extends Equatable {
  const AudioPlayerEvent();

  @override
  List<Object> get props => [];
}

class PickAudioEvent extends AudioPlayerEvent {}

class PlayAudioEvent extends AudioPlayerEvent {}

class StopAudioEvent extends AudioPlayerEvent {}
