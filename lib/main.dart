import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'VideoPlayer/video_player_home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        // systemNavigationBarColor: Colors.blue, // navigation bar color
        // statusBarColor: Colors.pink, // status bar color
        ),
  );
  runApp(
    const StartingPoint(),
  );
}

class StartingPoint extends StatelessWidget {
  const StartingPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Explore",
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.brown.shade400,
        ),
      ),
      home: const VideoPlayerHome(),
    );
  }
}

enum ThemeEnum {
  noTheme,
  videoPlayerTheme,
}

getTheme() {
  switch (ThemeEnum) {
    
  }
}
