import "package:eat_sneakers/theme.dart";
import "package:flutter/material.dart";

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'Chat Page',
      style: primaryTextStyle.copyWith(fontSize: 20),
    ));
  }
}
