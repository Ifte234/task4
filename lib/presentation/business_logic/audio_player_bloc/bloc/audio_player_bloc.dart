import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task4/data/utils/Audio_picker_utils.dart';
import 'package:audioplayers/audioplayers.dart';

import 'audio_player_event.dart';
import 'audio_player_state.dart';


class AudioPlayerBloc extends Bloc<AudioPlayerEvent, AudioPlayerState> {
  final AudioPickerUtils audioPickerUtils;
  late AudioPlayer _audioPlayer;

  AudioPlayerBloc(this.audioPickerUtils) : super(AudioPlayerInitial()) {
    _audioPlayer = AudioPlayer();
    on<PickAudioEvent>(_onPickAudio);
    on<PlayAudioEvent>(_onPlayAudio);
    on<StopAudioEvent>(_onStopAudio);
  }

  @override
  Future<void> close() {
    _audioPlayer.dispose();
    return super.close();
  }

  void _onPickAudio(PickAudioEvent event, Emitter<AudioPlayerState> emit) async {
    final file = await audioPickerUtils.audiopicker();
    emit(GetAudioState(myfile: file.path));
  }

  void _onPlayAudio(PlayAudioEvent event, Emitter<AudioPlayerState> emit) async {
    if (state is GetAudioState) {
      final audioPath = (state as GetAudioState).myfile;
      final uri = Uri.file(audioPath);

      // await _audioPlayer.play(uri as Source);
      await _audioPlayer.play(DeviceFileSource(audioPath));
      emit(AudioPlayingState());
    }
  }




  void _onStopAudio(StopAudioEvent event, Emitter<AudioPlayerState> emit) async {
    await _audioPlayer.stop();
    emit(AudioPlayerInitial());
  }
}
