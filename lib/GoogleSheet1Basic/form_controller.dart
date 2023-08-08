// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'feedback_form_class.dart';

class FormController {
  final String url =
      "https://script.google.com/macros/s/AKfycbzfMzcSQjWdbsPtf_FjpvJnEm7SYMlNNPS_mBBMZE2OYDC8Psy_uwvWZQbtxUpNc1pT/exec";

  // Success Status Message
  static const status = "SUCCESS";

  /// Async function which saves feedback, parses [FeedbackFromModel] parameters
  /// and sends HTTP GET request on [url]. On successful response, [callback] is called.

  void submitForm({
    required FeedbackFromModel feedbackFromModel,
    required ValueChanged<String> callback,
  }) async {
    debugPrint('feedbackFromModel => ${feedbackFromModel.toJson()}');
    try {
      await http
          .post(
        Uri.parse(url),
        body: (feedbackFromModel.toJson()),
      )
          .then(
        (response) async {
          debugPrint('responseHeader => ${response.headers}');
          debugPrint('response => $response');
          debugPrint('responseCode => ${response.statusCode}');
          debugPrint("header => ${response.headers}");
          if (response.statusCode == 200 || response.statusCode == 302) {
            // 302 mobile
            // 200 web
            if (response.statusCode == 302) {
              final url = response.headers["location"] ?? "";
              debugPrint('url => $url');
              await http.get(Uri.parse(url)).then(
                (res) {
                  debugPrint('res => $res  ==> ${res.body}');
                  callback(jsonDecode(res.body)["status"]);
                },
              );
            } else {
              callback(jsonDecode(response.body)["status"]);
            }
          } else {
            callback(jsonDecode(response.body)["status"]);
          }
        },
      );
    } on HttpException catch (e) {
      debugPrint("HttpException Error : $e");
    } catch (e) {
      debugPrint("catchError : $e");
    }
  }

  /// get list from googleSheet

  Future<List<FeedbackFromModel>> getFeedbackList() async {
    try {
      return await http.get(Uri.parse(url)).then(
        (response) async {
          debugPrint('responseCode : ${response.statusCode}');
          debugPrint(
              'getResponse =>${response.body.runtimeType} ${response.body}');
          final list = jsonDecode(response.body);
          list.forEach((element) {
            debugPrint('Get=>$element');
          });
          return List.from(
            list.map(
              (e) => FeedbackFromModel.fromJson(e),
            ),
          );
        },
      );
    } catch (e) {
      debugPrint('error : $e');
      return [];
    }
  }
}

// https://medium.com/mindorks/storing-data-from-the-flutter-app-google-sheets-e4498e9cda5d
