import "package:eat_sneakers/pages/widget/chat_tile.dart";
import "package:eat_sneakers/theme.dart";
import "package:flutter/material.dart";

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          'Message Support',
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyChat() {
      return Expanded(
          child: Container(
        width: double.infinity,
        color: backgroundColor3,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/icon_headset.png',
            width: 80,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Oops no message yet?',
            style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          const SizedBox(height: 12),
          Text(
            'You have never done a transaction',
            style: tertiaryTextStyle.copyWith(fontSize: 14),
          ),
          const SizedBox(height: 20),
          Container(
            height: 44,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10,
                ),
              ),
              child: Text(
                'Explore Store',
                style:
                    primaryTextStyle.copyWith(fontWeight: medium, fontSize: 16),
              ),
            ),
          )
        ]),
      ));
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.only(
            right: defaultMargin, top: defaultMargin, left: defaultMargin),
        child: Column(
          children: [ChatTile()],
        ),
      );
    }

    return Column(
      children: [header(), content()],
    );
  }
}
