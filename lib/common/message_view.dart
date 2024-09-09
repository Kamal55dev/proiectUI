import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final messageProvider = Provider<MessageHandler>((ref) {
  return MessageHandler();
});

class MessageHandler {
  void showErrorMessage(BuildContext context, int statusCode, String message) {
    Color backgroundColor;
    if (statusCode == 200) {
      backgroundColor = Colors.green;
    } else if (statusCode == 500 || statusCode == 401 || statusCode == 404) {
      backgroundColor = Colors.red;
    } else {
      backgroundColor = Colors.brown;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
