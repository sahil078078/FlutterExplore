import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_explore/GoogleSheet1Basic/feedback_form_class.dart';
import 'package:flutter_explore/GoogleSheet1Basic/form_controller.dart';

class Sheet1CreateResponse extends StatefulWidget {
  const Sheet1CreateResponse({Key? key}) : super(key: key);

  @override
  State<Sheet1CreateResponse> createState() => _Sheet1CreateResponseState();
}

class _Sheet1CreateResponseState extends State<Sheet1CreateResponse> {
  // controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController feedbackController = TextEditingController();

  // keys
  final _formKey = GlobalKey<FormState>();

  // submit form & save in googleSheet

  void _submitForm() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      FeedbackFromModel feedbackFromModel = FeedbackFromModel(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        mobile: mobileNoController.text.trim(),
        feedback: feedbackController.text.trim(),
      );

      debugPrint('userInput => ${feedbackFromModel.toJson()}');

      FormController formController = FormController();

      formController.submitForm(
        feedbackFromModel: feedbackFromModel,
        callback: (response) {
          debugPrint('response <=> <=> <=> $response');
          _showSnackBar(context);
          Navigator.pop(context, response);
        },
      );
    }
  }

  // method to show snackBar
  void _showSnackBar(BuildContext context) {
    final SnackBar snackBar = SnackBar(
      content: const Text("SnackBar"),
      action: SnackBarAction(
        label: "Okay",
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Response"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 12,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  maxLines: 1,
                  validator: (name) {
                    if (name != null && name.trim().isNotEmpty) return null;
                    return "Please enter your name";
                  },
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: "Name",
                    hintText: "Enter your name",
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: mobileNoController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                  ],
                  maxLines: 1,
                  maxLength: 10,
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: "Mobile",
                    hintText: "Enter your mobile",
                    counterText: "",
                  ),
                  validator: (mob) {
                    if (mob != null && mob.trim().isNotEmpty) {
                      if (mob.trim().length != 10) {
                        return "invalid mobile number";
                      } else if (mob.trim().startsWith("0")) {
                        return "Mobile number not start with 0";
                      } else {
                        return null;
                      }
                    }
                    return "Please enter mobile number";
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: emailController,
                  maxLines: 1,
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (email != null && email.trim().isNotEmpty) {
                      Pattern pattern =
                          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
                      RegExp regexp = RegExp(pattern.toString());

                      if (!regexp.hasMatch(email.trim())) {
                        return "invalid email";
                      }
                      return null;
                    }

                    return "Please enter your email";
                  },
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: "Email",
                    hintText: "Enter your email",
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: feedbackController,
                  maxLines: 3,
                  validator: (feed) {
                    if (feed != null && feed.trim().isNotEmpty) return null;
                    return "Please enter your feedback";
                  },
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    alignLabelWithHint: true,
                    labelText: "Feedback",
                    hintText: "Enter feedback",
                    counterText: "",
                  ),
                ),
                const SizedBox(height: 35),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
