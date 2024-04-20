import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Navigation Drawer',
            )),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(

                decoration: BoxDecoration(

                  image: DecorationImage(fit: BoxFit.contain,image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRseRj5MjxLYtgPrmGHS01YBytPjIkGKk8Zaw&s'))
                  // color: Colors.deepPurple,
                ),
                // child: Textstyle: TextStyle(color: Colors.deepPurple),),
                child: Text(''),
              ),
              Container(
                // color: Colors.teal,
                child: ListTile(
                  leading: Icon(
                    Icons.video_library,
                    color: Colors.deepPurple,
                  ),
                  title: const Text('Video Screen',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple),),
                  onTap: () {
                    Navigator.pushNamed(context, '/video');
                      },
                ),
              ),
              Container(

                child: ListTile(
                  leading: Icon(
                    Icons.image_sharp,
                    color: Colors.deepPurple,
                  ),
                  title: const Text('Image Screen',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple)),
                  onTap: () {
                    Navigator.pushNamed(context, '/image');
                  },
                ),
              ),
              Container(
                // color: Colors.teal,
                child: ListTile(
                  leading: Icon(
                    Icons.library_music,
                    color: Colors.deepPurple,
                  ),
                  title: const Text('Audio Screen',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple)),
                  onTap: () {
                    Navigator.pushNamed(context, '/audio');
                  },
                ),
              ),
            ],
          ),
        ),
        body: Center(child: Text('Data')),
      ),
    );
  }
}
