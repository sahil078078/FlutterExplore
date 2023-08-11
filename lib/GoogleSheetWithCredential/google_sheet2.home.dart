import 'package:flutter/material.dart';
import 'package:flutter_explore/GoogleSheetWithCredential/Pages/create_sheet_page.dart';
import 'package:flutter_explore/GoogleSheetWithCredential/Pages/modify_sheets_pages.dart';

class GoogleSheet2Home extends StatefulWidget {
  const GoogleSheet2Home({super.key});

  @override
  State<GoogleSheet2Home> createState() => _GoogleSheet2HomeState();
}

class _GoogleSheet2HomeState extends State<GoogleSheet2Home> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GoogleSheet"),
      ),
      body: currentIndex == 0
          ? const CreateSheetPage()
          : const ModifySheetsPages(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() => currentIndex = i),
        items: const [
          BottomNavigationBarItem(
            label: "Create",
            icon: Text("Create Sheet Data"),
          ),
          BottomNavigationBarItem(
            label: "Update",
            icon: Text("Update Sheet Data"),
          ),
        ],
      ),
    );
  }
}
