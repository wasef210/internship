import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:internship/view/dialog_widget.dart';

class RegisterController extends GetxController {
  var obscurePassword = true.obs;
  var obscureConfirmPassword = true.obs;
  var isLoading = false.obs;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void toggleObscurePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleObscureConfirmPassword() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  Future<void> register() async {
    isLoading.value = true;

    final username = usernameController.text;
    final email = emailController.text;
    final mobile = mobileController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (password != confirmPassword) {
      Get.dialog(
        ErrorDialog(
          title: 'Error',
          message: 'Passwords do not match',
          buttonText: 'OK',
          onButtonPressed: () {
            Get.back();
          },
        ),
      );
      isLoading.value = false;
      return;
    }

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
        Uri.parse('api'),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        Get.toNamed('/auth');
      } else {
        Get.dialog(
          ErrorDialog(
            title: 'Oh no!',
            message: 'Something went wrong\n      Please try again!',
            buttonText: 'Try again',
            onButtonPressed: () {
              Get.back();
            },
          ),
        );
      }
    } catch (e) {
      Get.dialog(
        ErrorDialog(
          title: 'Oh no!',
          message: 'Something went wrong\n      Please try again!',
          buttonText: 'Try again',
          onButtonPressed: () {
            Get.back();
          },
        ),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
