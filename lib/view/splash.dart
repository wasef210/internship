import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship/controller/splash_controller.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
              ),
              child: Image.asset(
                'assets/Logo.png',
              ),
            ),
          ),


        ],
      ),
    );
  }
}
