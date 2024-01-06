import 'package:eat_sneakers/models/cart_model.dart';
import 'package:eat_sneakers/providers/cart_provider.dart';
import 'package:eat_sneakers/theme.dart';
import 'package:flutter/material.dart';

class CheckoutCard extends StatelessWidget {
  // const CheckoutCard(CartModel cart, {super.key});

  final CartModel cart;
  CheckoutCard(this.cart);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: backgroundColor4),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: Row(
        children: [
          ClipRRect(
            child: Image.asset(
              'assets/image_shoes.png',
              width: 60,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cart.product.name,
                  style: primaryTextStyle.copyWith(
                      fontSize: 14, fontWeight: semibold),
                ),
                Text(
                  'IDR${cart.product.price}00',
                  style:
                      priceTextStyle.copyWith(fontSize: 14, fontWeight: medium),
                ),
              ],
            ),
          ),
          Text(
            '${cart.quantity} Items',
            style: secondaryTextStyle.copyWith(fontSize: 12),
          )
        ],
      ),
    );
  }
}
