// ignore_for_file: prefer_const_constructors

import 'package:eat_sneakers/models/product_model.dart';
import 'package:eat_sneakers/pages/home/product_page.dart';
import 'package:eat_sneakers/providers/wishlist_provider.dart';
import 'package:eat_sneakers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistCard extends StatelessWidget {
  // const WishlistCard(ProductModel product, {super.key});

  final ProductModel product;
  WishlistCard(this.product);

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductPage(product)));
      },
      child: Container(
        margin: EdgeInsets.only(top: 12, right: 20, left: 20),
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
                    product.name,
                    style: primaryTextStyle.copyWith(
                        fontSize: 14, fontWeight: semibold),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'IDR${product.price}00',
                    style: priceTextStyle.copyWith(fontSize: 14),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                wishlistProvider.setProduct(product);
              },
              child: Image.asset(
                wishlistProvider.isWishlist(product)
                    ? 'assets/button_wishlist_blue.png'
                    : 'assets/button_wishlist_gray.png',
                width: 34,
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}
