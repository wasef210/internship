import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:internship/view/dialog_widget.dart';

class LoginController extends GetxController {
  var obscureText = true.obs;
  var isLoading = false.obs;
  var rememberMe = false.obs;

  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }

  Future<void> login() async {
    isLoading.value = true;
    final email = emailController.text;
    final mobile = mobileController.text;
    final password = passwordController.text;

    try {
      String token = "your_auth_token";
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var body = {
        'email': email,
        'mobile': mobile,
        'password': password,
      };

      var response = await http.post(
        Uri.parse('api'),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        Get.offNamed('/home');
      } else {
        Get.dialog(
          const ErrorDialog(
            title: 'Sorry!',
            message: 'Incorrect password or email',
          ),
        );
      }
    } catch (e) {
      Get.dialog(
        const ErrorDialog(
          title: 'Sorry!',
          message: 'Incorrect password or email',
        ),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
