import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:internship/view//dialog_widget.dart';

class LoginController extends GetxController {
  var obscureText = true.obs;

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }

  void showErrorDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ErrorDialog(
          title: title,
          message: message,
        );
      },
    );
  }

  Future<void> login(String email, String password, BuildContext context) async {
    try {
      String token = "your_auth_token";
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var body = {
        'email': email,
        'password': password,
      };

      var response = await http.post(
        Uri.parse('https://your.api.endpoint/login'),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {

      } else {
        showErrorDialog(context, "Error", "Login failed: ${response.body}");
      }
    } catch (e) {
      showErrorDialog(context, "Error", "An error occurred: $e");
    }
  }
}
