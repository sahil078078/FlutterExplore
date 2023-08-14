import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'GoogleSheetWithCredential/google_sheet2.home.dart';
import 'GoogleSheetWithCredential/users_sheets_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // * This is for init google sheet before used
  await UserSheetsAPI.init();
  await UserFormAPI2.init();
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
      // home: const CreateSheetPage(),
      home: const GoogleSheet2Home(),
    );
  }
}
