import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../presentation/home/audio_screen/AudioScreen.dart';
import '../../presentation/home/home_screen.dart';
import '../../presentation/home/image_screen/ImageScreen.dart';
import '../../presentation/home/video_screen/VideoScreen.dart';

class Routes {
  static Route? onGeneratedRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (context) => HomeScreen());

      case '/video':
        return MaterialPageRoute(builder: (context) => VideoScreen());

      case '/audio':
        return MaterialPageRoute(builder: (context) => AudioScreen());


      case '/image':
        return MaterialPageRoute(builder: (context) => ImageScreen());

    }
  }
}