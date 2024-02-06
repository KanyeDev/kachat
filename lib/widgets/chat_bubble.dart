import 'package:flutter/material.dart';
import 'package:kachat/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(
      {super.key, required this.message, required this.isCurrentUser});

  final String message;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    return Container(
      constraints: const BoxConstraints(maxWidth: 250),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
      decoration: BoxDecoration(
          color: isCurrentUser
              ? (isDarkMode ? Colors.green.shade600 : const Color(0xffA5C1C0))
              : (isDarkMode ? Colors.grey.shade800 : Colors.grey.shade400),
          borderRadius: isCurrentUser ? const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(60),
              bottomRight: Radius.circular(0)) :
          const BorderRadius.only(
              bottomLeft: Radius.circular(0),
              topLeft: Radius.circular(60),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(30))),
      child: Text(message),
    );
  }
}
