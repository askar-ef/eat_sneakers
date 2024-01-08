import 'package:eat_sneakers/models/message_model.dart';
import 'package:eat_sneakers/models/product_model.dart';
import 'package:eat_sneakers/pages/widget/chat_bubble.dart';
import 'package:eat_sneakers/providers/auth_provider.dart';
import 'package:eat_sneakers/services/message_service.dart';
import 'package:eat_sneakers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailChatPage extends StatefulWidget {
  ProductModel product;
  DetailChatPage(this.product);

  @override
  State<DetailChatPage> createState() => _DetailChatPageState();
}

class _DetailChatPageState extends State<DetailChatPage> {
  TextEditingController messageController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleAddMessage() async {
      await MessageServices().addMessage(
        user: authProvider.user,
        isFromUser: true,
        product: widget.product,
        message: messageController.text,
      );
      setState(() {
        widget.product = UninitializedProductModel();
        messageController.text = '';
      });
    }

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor3,
        centerTitle: false,
        title: Row(
          children: [
            Image.asset(
              'assets/image_shoe_store.png',
              width: 50,
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shoe Store',
                  style: primaryTextStyle.copyWith(
                      fontSize: 14, fontWeight: medium),
                ),
                Text(
                  'Online',
                  style: secondaryTextStyle.copyWith(
                      fontSize: 14, fontWeight: light),
                ),
              ],
            )
          ],
        ),
        elevation: 0,
        toolbarHeight: 80,
      );
    }

    Widget productPreview() {
      return Container(
        width: 225,
        height: 90,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 10, left: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: backgroundColor5,
            border: Border.all(color: primaryColor)),
        child: Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/image_shoes.png',
              width: 62,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.name,
                  style: primaryTextStyle.copyWith(
                      fontWeight: regular, fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'IDR${widget.product.price}00',
                  style:
                      priceTextStyle.copyWith(fontWeight: medium, fontSize: 14),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.product = UninitializedProductModel();
              });
            },
            child: Image.asset(
              'assets/button_close.png',
              width: 22,
            ),
          )
        ]),
      );
    }

    Widget chatInput() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.product is UninitializedProductModel
                ? SizedBox()
                : productPreview(),
            Container(
              color: backgroundColor1,
              padding:
                  EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                          color: backgroundColor4,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: TextFormField(
                          controller: messageController,
                          decoration: InputDecoration.collapsed(
                              hintText: 'Type Message ...',
                              hintStyle: secondaryTextStyle),
                          style: primaryTextStyle,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      handleAddMessage();
                    },
                    child: Image.asset(
                      'assets/button_send.png',
                      width: 45,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return StreamBuilder<List<MessageModel>>(
        stream:
            MessageServices().getMessagesByUserId(userId: authProvider.user.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              children: snapshot.data!
                  .map((MessageModel message) => ChatBubble(
                        isSender: message.isFromUser,
                        text: message.message,
                        product: message.product,
                      ))
                  .toList(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error: ${snapshot.error}",
                style: primaryTextStyle,
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      body: Column(
        children: [
          header(),
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(child: content()),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: chatInput(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
