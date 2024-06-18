import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship/controller/timer_controller.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final TimerController controller = Get.put(TimerController());

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Obx(() {
          return Text(
            controller.timerText,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.green,
            ),
          );
        }),
        const SizedBox(height: 10),
        Obx(() {
          return Row(
            children: [
              const SizedBox(width: 20),
              TextButton(
                onPressed:
                controller.isButtonEnabled ? controller.resetTimer : null,
                child: const Text(
                  'Send Again',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}