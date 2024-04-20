import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/image_picker_bloc/bloc/image_bloc.dart';
import '../../business_logic/image_picker_bloc/bloc/image_state.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<ImageBloc, ImageState>(builder: (context, state) {
          if (state.file == null) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        context.read<ImageBloc>().add(CameraCapture());
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
                        context.read<ImageBloc>().add(GalleryImagePicker());
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
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Image Screen',style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.file(File(state.file!.path.toString()))),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                          onPressed: () {
                            context.read<ImageBloc>().add(CameraCapture());
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
                            context.read<ImageBloc>().add(GalleryImagePicker());
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
                )
              ],
            );
          }
        }),
      ),
    );
  }
}
