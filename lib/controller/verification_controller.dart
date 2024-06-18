import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VerificationController extends GetxController {
  var code = List.filled(6, '').obs;
  var isCodeValid = false.obs;
  var isLoading = false.obs;

  void updateCode(String value, int index) {
    code[index] = value;
    checkCodeValidity();
  }

  void checkCodeValidity() {
    isCodeValid.value = code.every((element) => element.isNotEmpty);
  }

  Future<void> sendVerificationCode(String email) async {
    isLoading.value = true;

    try {
      String token = "your_auth_token";
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var body = jsonEncode({'email': email});

      var response = await http.post(
        Uri.parse('https://your.api.endpoint/send_code'),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {

      } else {
        showErrorDialog("Error", "Failed to send verification code");
      }
    } catch (e) {
      showErrorDialog("Error", "An error occurred");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> verifyCode() async {
    if (!isCodeValid.value) {

      return;
    }

    isLoading.value = true;

    try {
      String token = "your_auth_token";
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var body = jsonEncode({'code': code.join()});

      var response = await http.post(
        Uri.parse('https://your.api.endpoint/verify_code'),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        Get.snackbar("Success", "Code verified successfully");
        // Navigate to the next screen or perform other actions upon successful verification
      } else {
        showErrorDialog("Error", "Verification failed");
      }
    } catch (e) {
      showErrorDialog("Error", "An error occurred");
    } finally {
      isLoading.value = false;
    }
  }

  void showErrorDialog(String title, String message) {
    Get.dialog(
      AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text("Try Again"),
            onPressed: () {
              Get.back(); // Close the dialog
              verifyCode(); // Retry verification
            },
          ),
        ],
      ),
      barrierDismissible: true,
    );
  }
}
