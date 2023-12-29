import 'package:eat_sneakers/models/cart_model.dart';
import 'package:eat_sneakers/providers/cart_provider.dart';
import 'package:eat_sneakers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartCard extends StatelessWidget {
  // const CartCard({super.key});

  final CartModel cart;
  CartCard(this.cart);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Container(
      margin: EdgeInsets.only(bottom: 16),
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
                      cart.product.name,
                      style: primaryTextStyle.copyWith(
                          fontSize: 14, fontWeight: semibold),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text('IDR${cart.product.price}000',
                        style: priceTextStyle.copyWith(
                          fontSize: 14,
                        )),
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      cartProvider.addQuantity(cart.id);
                    },
                    child: Image.asset(
                      'assets/icon_plus_circle.png',
                      width: 16,
                    ),
                  ),
                  Text(cart.quantity.toString(),
                      style: primaryTextStyle.copyWith(fontSize: 14)),
                  GestureDetector(
                    onTap: () {
                      cartProvider.reduceQuantitiy(cart.id);
                    },
                    child: Image.asset(
                      'assets/icon_min_circle.png',
                      width: 16,
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 6,
          ),
          GestureDetector(
            onTap: () {
              cartProvider.removeCart(cart.id);
            },
            child: Row(
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
                  style:
                      alertTextStyle.copyWith(fontSize: 14, fontWeight: light),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
