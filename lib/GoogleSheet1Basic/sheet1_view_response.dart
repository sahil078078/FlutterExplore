import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_explore/GoogleSheet1Basic/feedback_form_class.dart';
import 'package:flutter_explore/GoogleSheet1Basic/form_controller.dart';
import 'package:flutter_explore/GoogleSheet1Basic/sheet1_create_response.dart';

class Sheet1ViewResponse extends StatefulWidget {
  const Sheet1ViewResponse({super.key});

  @override
  State<Sheet1ViewResponse> createState() => _Sheet1ViewResponseState();
}

class _Sheet1ViewResponseState extends State<Sheet1ViewResponse> {
  List<FeedbackFromModel> responseList = [];
  FormController formController = FormController();
  bool isLoading = false;
  @override
  void initState() {
    // call get API
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getResponse();
    });
    super.initState();
  }

  Future<void> getResponse() async {
    setState(() => isLoading = true);
    responseList = await formController.getFeedbackList();
    setState(() => isLoading = false);
  }

  Widget keyValue({required String key, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          key,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.black.withOpacity(0.35),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 12.5,
            fontWeight: FontWeight.w600,
            color: Colors.black.withOpacity(0.85),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ViewResponse"),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () async {
          final res = await Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const Sheet1CreateResponse(),
            ),
          );

          if (res == "SUCCESS") {
            getResponse();
          }
        },
        child: const Icon(
          Icons.add,
          size: 18,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 12,
        ),
        child: RefreshIndicator(
          onRefresh: () async {
            getResponse();
          },
          child: isLoading
              ? const Center(
                  child: CupertinoActivityIndicator(
                    color: Colors.black,
                    radius: 15,
                  ),
                )
              : responseList.isNotEmpty
                  ? ListView.builder(
                      padding: const EdgeInsets.only(bottom: 45),
                      itemCount: responseList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: Colors.black.withOpacity(0.15),
                              width: 0.75,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              keyValue(
                                key: "Name",
                                value: responseList.elementAt(index).name,
                              ),
                              const SizedBox(height: 5),
                              keyValue(
                                key: "Email",
                                value: responseList.elementAt(index).email,
                              ),
                              const SizedBox(height: 5),
                              keyValue(
                                key: "Mobile",
                                value: responseList.elementAt(index).mobile,
                              ),
                              const SizedBox(height: 5),
                              keyValue(
                                key: "Feedback",
                                value: responseList.elementAt(index).feedback,
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        "EmptyList\nAdd data",
                        style: TextStyle(
                          fontSize: 15.5,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.55),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
        ),
      ),
    );
  }
}
