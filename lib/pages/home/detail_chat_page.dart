import 'package:eat_sneakers/theme.dart';
import 'package:flutter/material.dart';

class DetailChatPage extends StatelessWidget {
  const DetailChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
            backgroundColor: backgroundColor1,
          ));
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      // appBar: header(),
    );
  }
}
