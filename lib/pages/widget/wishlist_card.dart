// ignore_for_file: prefer_const_constructors

import 'package:eat_sneakers/theme.dart';
import 'package:flutter/material.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: backgroundColor4),
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusDirectional.circular(12),
            child: Image.asset(
              'assets/image_shoes.png',
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ultraboost Camo',
                  style: primaryTextStyle.copyWith(
                      fontSize: 14, fontWeight: semibold),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'IDR2.700',
                  style: priceTextStyle.copyWith(fontSize: 14),
                )
              ],
            ),
          ),
          Image.asset(
            'assets/button_wishlist_blue.png',
            width: 34,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
