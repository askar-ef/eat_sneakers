// ignore_for_file: prefer_const_constructors

import 'package:eat_sneakers/models/product_model.dart';
import 'package:eat_sneakers/pages/home/detail_chat_page.dart';
import 'package:eat_sneakers/theme.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, '/detail-chat');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailChatPage(UninitializedProductModel())));
      },
      child: Container(
        child: Column(children: [
          Row(
            children: [
              Image.asset(
                'assets/image_shoe_store.png',
                width: 54,
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shoe Store',
                      style: primaryTextStyle.copyWith(
                          fontSize: 15, fontWeight: regular),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Good night, this item is on tour',
                      style: secondaryTextStyle.copyWith(
                          fontSize: 14, fontWeight: regular),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Text('Now', style: secondaryTextStyle.copyWith(fontSize: 10))
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Divider(
            thickness: 1,
            color: backgroundColor2,
          )
        ]),
      ),
    );
  }
}
