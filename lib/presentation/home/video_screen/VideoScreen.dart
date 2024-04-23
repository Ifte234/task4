import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task4/presentation/business_logic/video_picker_bloc/bloc/video_picker_bloc.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<VideoPickerBloc, VideoPickerState>(builder: (context, state) {

          if (state.file == null) {
            print('State ${state}');
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        context.read<VideoPickerBloc>().add(CameraEvent());
                      },
                      child: Row(children: [
                        Icon(Icons.camera_alt_rounded),
                        SizedBox(
                          width: 8,
                        ),
                        Text('Open Camera')
                      ])),
                  SizedBox(
                    width: 7,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        context.read<VideoPickerBloc>().add(GalleryPickerEvent());
                      },
                      child: Row(children: [
                        Icon(Icons.image),
                        SizedBox(
                          width: 8,
                        ),
                        Text('Open Gallery')
                      ]))
                ],
              ),
            );
          } else {

print("Hello${VideoPlayerController.file(File(state.file!.path))}");
// setState(){
//   var _controller = VideoPlayerController.file(File(state.file!.path))
// }
            // file(File()) ;

          final controller = VideoPlayerController.file(File(state.file!.path));

          return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Text(
          'Video Screen',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: FutureBuilder(
          future: controller.initialize(),
          builder: (context, snapshot) {
            controller.play();
          if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
          );
          } else {
          return CircularProgressIndicator();
          }
          },
          ),))]);
          }

        }),
      ),

    );
  }
}
