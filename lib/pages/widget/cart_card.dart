import 'package:eat_sneakers/theme.dart';
import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          color: backgroundColor4, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  'assets/image_shoes.png',
                  width: 60,
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
                    Text('IDR2.700',
                        style: priceTextStyle.copyWith(
                          fontSize: 14,
                        )),
                  ],
                ),
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/icon_plus_circle.png',
                    width: 16,
                  ),
                  Text('2', style: primaryTextStyle.copyWith(fontSize: 14)),
                  Image.asset(
                    'assets/icon_min_circle.png',
                    width: 16,
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Image.asset(
                'assets/icon_remove.png',
                width: 12,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                'Remove',
                style: alertTextStyle.copyWith(fontSize: 14, fontWeight: light),
              )
            ],
          )
        ],
      ),
    );
  }
}
