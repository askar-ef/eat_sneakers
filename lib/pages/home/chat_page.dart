import "package:eat_sneakers/models/message_model.dart";
import "package:eat_sneakers/pages/widget/chat_tile.dart";
import "package:eat_sneakers/providers/auth_provider.dart";
import "package:eat_sneakers/providers/page_provider.dart";
import "package:eat_sneakers/services/message_service.dart";
import "package:eat_sneakers/theme.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

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
              onPressed: () {
                pageProvider.currentIndex = 0;
              },
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
      return StreamBuilder<List<MessageModel>>(
          stream: MessageServices()
              .getMessagesByUserId(userId: authProvider.user.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.length == 0) {
                return emptyChat();
              }
              return Container(
                margin: EdgeInsets.only(
                    right: defaultMargin,
                    top: defaultMargin,
                    left: defaultMargin),
                child: Column(
                  children: [
                    ChatTile(snapshot.data![snapshot.data!.length - 1])
                  ],
                ),
              );
            } else {
              return emptyChat();
            }
          });
    }

    return Column(
      children: [header(), content()],
    );
  }
}
