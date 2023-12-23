import 'package:eat_sneakers/theme.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 215,
      height: 278,
      margin: EdgeInsets.only(right: defaultMargin),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: primaryTextColor),
      child: Column(
        children: [
          SizedBox(
            height: defaultMargin,
          ),
          Image.asset(
            'assets/image_shoes.png',
            width: 215,
            height: 150,
            fit: BoxFit.cover,
          ),
          Column(
            children: [Text('Running')],
          )
        ],
      ),
    );
  }
}
