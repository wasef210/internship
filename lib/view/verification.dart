import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship/View/timer.dart';
import 'package:internship/controller/verification_controller.dart';

class Verification extends StatelessWidget {
  final VerificationController _verificationController = Get.put(VerificationController());

  Verification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/Logo.png",
                width: 300,
              ),
              const Row(
                children: [
                  Text(
                    "Verification Code",
                    style: TextStyle(
                      color: Color.fromARGB(255, 3, 80, 20),
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              const Text(
                "We have sent the verification code to your Email address",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(6, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: TextField(
                        maxLength: 1,
                        cursorHeight: 20,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        decoration: InputDecoration(
                          counterText: '',
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        onChanged: (value) {
                          _verificationController.updateCode(value, index);
                          if (value.isNotEmpty && index < 5) {
                            FocusScope.of(context).nextFocus();
                          } else if (index == 5 && value.isNotEmpty) {
                            _verificationController.verifyCode();
                          }
                        },
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),
              const TimerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
