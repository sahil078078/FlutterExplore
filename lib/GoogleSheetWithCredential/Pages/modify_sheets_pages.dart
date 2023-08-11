import 'package:flutter/material.dart';
import 'package:flutter_explore/GoogleSheetWithCredential/Widgets/navigate_user_widget.dart';
import 'package:flutter_explore/GoogleSheetWithCredential/Widgets/user_form_widget.dart';
import 'package:flutter_explore/GoogleSheetWithCredential/users_sheets_api.dart';

import '../Models/user.dart';

class ModifySheetsPages extends StatefulWidget {
  const ModifySheetsPages({super.key});

  @override
  State<ModifySheetsPages> createState() => _ModifySheetsPagesState();
}

class _ModifySheetsPagesState extends State<ModifySheetsPages> {
  List<User> users = [];
  int index = 0;
  @override
  void initState() {
    getUsers();
    super.initState();
  }

  Future getUsers() async {
    // final user = await UserSheetsAPI.getById(2);

    final users = await UserSheetsAPI.getAll();

    setState(() => this.users = users);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("ModifySheet"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                UserFromWidget(
                  user: users.isNotEmpty ? users[index] : null,
                  onSaveUser: (user) async {},
                ),
                const SizedBox(height: 16),
                if (users.isNotEmpty) buildUserController(),
              ],
            ),
          ),
        ),
      );

  Widget buildUserController() => NavigateUserWidget(
        text: "${1 + index}/${users.length} Users",
        onPrevious: () {
          final previousIndex = index <= 0 ? users.length - 1 : index - 1;

          setState(() => index = previousIndex);
        },
        onNext: () {
          final nextIndex = index >= users.length - 1 ? 0 : index + 1;
          debugPrint('$nextIndex');

          setState(() => index = nextIndex);
        },
      );
}
