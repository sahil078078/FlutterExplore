import 'package:flutter/material.dart';
import 'package:flutter_explore/GoogleSheetWithCredential/Models/user.dart';
import 'package:flutter_explore/GoogleSheetWithCredential/Widgets/user_form_widget.dart';
import 'package:flutter_explore/GoogleSheetWithCredential/users_sheets_api.dart';

import '../Widgets/button_widgets.dart';

class CreateSheetPage extends StatelessWidget {
  const CreateSheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CreatePage"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        child: UserFromWidget(
          onSaveUser: (user) async {
            // final id = await UserSheetsAPI.getRowCount() + 1;
            // final newUser = user.copy(id: id);
            for (int i = 0; i < 1000000; i++) {
              final id = await UserSheetsAPI.getRowCount() + 1;
              final newUser = user.copy(id: id);
              await UserSheetsAPI.insert([newUser.toJson()]);
            }
          },
        ),
      ),
    );
  }
}
