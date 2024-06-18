import 'dart:async';
import 'package:get/get.dart';

class TimerController extends GetxController {
  static const int maxSeconds = 180;
  var remainingSeconds = maxSeconds.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
      } else {
        _timer?.cancel();
      }
    });
  }

  void resetTimer() {
    remainingSeconds.value = maxSeconds;
    startTimer();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  String get timerText {
    int minutes = remainingSeconds.value ~/ 60;
    int seconds = remainingSeconds.value % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  bool get isButtonEnabled => remainingSeconds.value == 0;
}