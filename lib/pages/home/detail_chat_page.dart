import 'package:eat_sneakers/models/product_model.dart';
import 'package:eat_sneakers/pages/widget/chat_bubble.dart';
import 'package:eat_sneakers/theme.dart';
import 'package:flutter/material.dart';

class DetailChatPage extends StatefulWidget {
  ProductModel product;
  DetailChatPage(this.product);

  @override
  State<DetailChatPage> createState() => _DetailChatPageState();
}

class _DetailChatPageState extends State<DetailChatPage> {
  @override
  Widget build(BuildContext context) {
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
        height: 74,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: backgroundColor5,
            border: Border.all(color: primaryColor)),
        child: Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/image_shoes.png',
              width: 54,
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
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.product is UninitializedProductModel
                ? SizedBox()
                : productPreview(),
            Row(
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
                        decoration: InputDecoration.collapsed(
                            hintText: 'Type Message ...',
                            hintStyle: secondaryTextStyle),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Image.asset(
                  'assets/button_send.png',
                  width: 45,
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          ChatBubble(
            text: 'ngetes doang ini',
            hasProduct: true,
          ),
          ChatBubble(
            isSender: false,
            text: 'oke test diterima tapi tunggu dulu jangan bikin malu',
            hasProduct: false,
          )
        ],
      );
    }

    return Container(
      child: Scaffold(
        backgroundColor: backgroundColor3,
        body: Column(
          children: [header(), Expanded(child: content()), chatInput()],
        ),
      ),
    );
  }
}
