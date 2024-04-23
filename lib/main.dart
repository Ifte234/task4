import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task4/data/utils/Audio_picker_utils.dart';
import 'package:task4/presentation/business_logic/audio_player_bloc/bloc/audio_player_bloc.dart';
import 'package:task4/presentation/business_logic/image_picker_bloc/bloc/image_bloc.dart';
import 'package:task4/presentation/business_logic/video_picker_bloc/bloc/video_picker_bloc.dart';
import 'data/utils/image_picker_utils.dart';
import 'data/utils/video_picker_utils.dart';
import 'helper/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ImageBloc(ImagePickerUtils())),
        BlocProvider(create: (_) => VideoPickerBloc(VideoPickerUtils())),
        BlocProvider(create: (_)=> AudioPlayerBloc(AudioPickerUtils())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: Routes.onGeneratedRoutes,
        initialRoute: '/home',
      ),
    );
  }
}
