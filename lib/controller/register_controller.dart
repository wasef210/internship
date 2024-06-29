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
    obscurePassword.toggle();
  }

  void toggleObscureConfirmPassword() {
    obscureConfirmPassword.toggle();
  }

  Future<void> register() async {
    isLoading.value = true;

    final username = usernameController.text.trim();
    final email = emailController.text.trim();
    final phoneNumber = mobileController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    print('Registering with:');
    print('Username: $username');
    print('Email: $email');
    print('Phone Number: $phoneNumber');

    try {
      var headers = {
        'Content-Type': 'application/json',
      };

      var body = {
        'name': username,
        'email': email,
        'phone_number': phoneNumber,
        'password': password,
        'password_confirmation': confirmPassword,
        'image': '',
        'certificate': '',
      };

      var response = await http.post(
        Uri.parse('https://task5-ammar-allaw.trainees-mad-s.com/api/auth/Signup'),
        headers: headers,
        body: jsonEncode(body),
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 201) {
        var responseData = jsonDecode(response.body);

        print('Registration successful');
        print('Response data: $responseData');

        clearControllers();

        Get.toNamed('/auth');
      } else {
        final jsonResponse = jsonDecode(response.body);
        print('Error response: $jsonResponse');

        Get.dialog(
          ErrorDialog(
            title: 'Error',
            message:  'Something went wrong. Please try again!',
            buttonText: 'Try again',
            onButtonPressed: () {
              Get.back();
            },
          ),
        );
      }
    } catch (e) {
      print('Error during registration: $e');
      Get.dialog(
        ErrorDialog(
          title: 'Error',
          message: 'Something went wrong. Please try again!',
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

  void clearControllers() {
    usernameController.clear();
    emailController.clear();
    mobileController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }
}
