import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String title;
  final String message;
  final String? buttonText;
  final VoidCallback? onButtonPressed;
  final String? secondButtonText;
  final VoidCallback? onSecondButtonPressed;

  const ErrorDialog({
    super.key,
    required this.title,
    required this.message,
    this.buttonText,
    this.onButtonPressed,
    this.secondButtonText,
    this.onSecondButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message),
          if (buttonText != null && onButtonPressed != null)
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Center(
                child: TextButton(
                  onPressed: onButtonPressed,
                  child: Text(buttonText!),
                ),
              ),
            ),
          if (secondButtonText != null && onSecondButtonPressed != null)
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Center(
                child: TextButton(
                  onPressed: onSecondButtonPressed,
                  child: Text(secondButtonText!),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
