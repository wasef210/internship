import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String title;
  final String message;
  final String? buttonText;
  final VoidCallback? onButtonPressed;

  const ErrorDialog({
    Key? key,
    required this.title,
    required this.message,
    this.buttonText,
    this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        if (buttonText != null && onButtonPressed != null)
          TextButton(
            onPressed: onButtonPressed,
            child: Text(buttonText!),
          ),

      ],
    );
  }
}
