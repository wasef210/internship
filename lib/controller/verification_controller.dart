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

  Future<void> verifyCode() async {
    if (!isCodeValid.value) {
      return;
    }

    isLoading.value = true;

    try {
      var headers = {
        'Content-Type': 'application/json',
      };

      var body = jsonEncode({
        'code': code.join(),
      });

      var response = await http.post(
        Uri.parse(
            'https://task5-ammar-allaw.trainees-mad-s.com/api/auth/VerifiedEmail'),
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
      } else {}
    } finally {
      isLoading.value = false;
    }
  }
}
