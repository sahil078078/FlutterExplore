import 'package:flutter/material.dart';
import 'package:flutter_explore/GoogleSheetWithCredential/Models/user.dart';
import 'package:flutter_explore/GoogleSheetWithCredential/Widgets/button_widgets.dart';

class UserFromWidget extends StatefulWidget {
  final User? user;
  final ValueChanged<User> onSaveUser;
  const UserFromWidget({super.key, required this.onSaveUser, this.user});

  @override
  State<UserFromWidget> createState() => _UserFromWidgetState();
}

class _UserFromWidgetState extends State<UserFromWidget> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  bool isBeginner = true;

  @override
  void initState() {
    super.initState();

    initUser();
  }

  @override
  void didUpdateWidget(covariant UserFromWidget oldWidget) {
    initUser();
    super.didUpdateWidget(oldWidget);
  }

  void initUser() {
    setState(() {
      nameController.text = widget.user?.name ?? "";
      emailController.text = widget.user?.email ?? "";
      isBeginner = widget.user?.isBeginner ?? false;
    });
  }

  @override
  Widget build(BuildContext context) => Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildName(),
            const SizedBox(height: 16),
            buildEmail(),
            const SizedBox(height: 16),
            buildFlutterBeginner(),
            const SizedBox(height: 16),
            submitButton(),
          ],
        ),
      );

  Widget buildName() => TextFormField(
        controller: nameController,
        decoration: const InputDecoration(
          labelText: "Name",
          border: OutlineInputBorder(),
        ),
        validator: (name) =>
            name != null && name.trim().isNotEmpty ? null : "Please enter name",
      );
  Widget buildEmail() => TextFormField(
        controller: emailController,
        decoration: const InputDecoration(
          labelText: "Email",
          border: OutlineInputBorder(),
        ),
        validator: (mail) => mail != null && mail.trim().isNotEmpty
            ? null
            : "Please enter email",
      );
  Widget buildFlutterBeginner() => SwitchListTile(
        value: isBeginner,
        title: const Text("Is Flutter Beginner"),
        contentPadding: EdgeInsets.zero,
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (_) => setState(() => isBeginner = _),
      );

  Widget submitButton() => ButtonWidget(
        text: "Save",
        onClick: () async {
          if (formKey.currentState != null &&
              formKey.currentState!.validate()) {
            final user = User(
              name: nameController.text.trim(),
              email: emailController.text.trim(),
              isBeginner: isBeginner,
            );

            widget.onSaveUser(user);
          }
        },
      );
}
