import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:internship/view/dialog_widget.dart';

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
      }
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
        Uri.parse('api'),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        Get.dialog(
          ErrorDialog(
            title: 'Success!',
            message: 'Verification succeeded!',
            buttonText: 'Continue',
            onButtonPressed: () {
              Get.offNamed('/login');
            },
          ),
        );
      } else {
      }
    } finally {
      isLoading.value = false;
    }
  }
}
