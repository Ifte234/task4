import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/audio_player_bloc/bloc/audio_player_bloc.dart';
import '../../business_logic/audio_player_bloc/bloc/audio_player_event.dart';
import '../../business_logic/audio_player_bloc/bloc/audio_player_state.dart';

class AudioScreen extends StatelessWidget {
  const AudioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400],
        title: Text(
          'Audio Screen',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<AudioPlayerBloc, AudioPlayerState>(
        builder: (context, state) {
          return Card(
            shadowColor: Colors.deepPurple[400],
            elevation: 3,
            child: ListTile(
              leading: Icon(Icons.album),
              title: Text("| Local Music |"),
              subtitle: Text(
                "- Tap to Pause/Resume - \n --  --",
              ),
              isThreeLine: true,
              trailing: IconButton(
                icon: Icon(Icons.stop),
                onPressed: () {
                  context.read<AudioPlayerBloc>().add(StopAudioEvent());
                },
              ),
              onTap: () {
                if (state is AudioPlayingState) {
                  context.read<AudioPlayerBloc>().add(StopAudioEvent());
                } else {
                  context.read<AudioPlayerBloc>().add(PlayAudioEvent());
                }
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurple[400],
        child: Container(
          height: 50,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.audiotrack),
        onPressed: () {
          context.read<AudioPlayerBloc>().add(PickAudioEvent());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
