import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'GoogleSheet1Basic/sheet1_view_response.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        // systemNavigationBarColor: Colors.blue, // navigation bar color
        // statusBarColor: Colors.pink, // status bar color
        ),
  );

  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      // DeviceOrientation.portraitDown,
      // DeviceOrientation.landscapeLeft,
      // DeviceOrientation.landscapeRight,

      /*
      lock app orientation and only portraitUp mode active, 
      */
    ],
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
      home: const Sheet1ViewResponse(),
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
