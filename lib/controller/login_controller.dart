import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
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
    final phoneNumber = mobileController.text;
    final password = passwordController.text;

    try {

      var headers = {
        'Content-Type': 'application/json',
      };

      var body = {
        'email': email,
        'phone_number':phoneNumber ,
        'password': password,
      };

      var response = await http.post(
        Uri.parse('https://task5-ammar-allaw.trainees-mad-s.com/api/auth/Login'),
        headers: headers,
        body: jsonEncode(body),
      );



      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        String? receivedToken = responseData['data']['token'];

        await _saveToken(receivedToken);

        Get.offNamed('/sp');
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

  Future<void> _saveToken(String? token) async {
    if (token != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
    }
  }
}
