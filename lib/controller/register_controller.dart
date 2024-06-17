import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:internship/view//dialog_widget.dart';

class RegisterController extends GetxController {
  var obscurePassword = true.obs;
  var obscureConfirmPassword = true.obs;
  var isLoading = false.obs;

  void toggleObscurePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleObscureConfirmPassword() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
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

  Future<void> register(String username, String email, String mobile, String password, String confirmPassword, BuildContext context) async {
    if (password != confirmPassword) {
      showErrorDialog(context, "Error", "Passwords do not match");
      return;
    }

    isLoading.value = true;

    try {

      String token = "your_auth_token";
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var body = {
        'username': username,
        'email': email,
        'mobile': mobile,
        'password': password,
      };

      var response = await http.post(
        Uri.parse('https://your.api.endpoint/register'),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        Get.snackbar("Success", "Registration successful");
        Get.toNamed('/login'); // Navigate to login screen
      } else {
        showErrorDialog(context, "Error", "Registration failed: ${response.body}");
      }
    } catch (e) {
      showErrorDialog(context, "Error", "An error occurred: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
