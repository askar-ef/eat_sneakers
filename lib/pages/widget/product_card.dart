import 'package:eat_sneakers/models/product_model.dart';
import 'package:eat_sneakers/pages/home/product_page.dart';
import 'package:eat_sneakers/theme.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  // const ProductCard({super.key});

  final ProductModel product;
  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductPage(product)));
      },
      child: Container(
        width: 215,
        height: 278,
        margin: EdgeInsets.only(right: defaultMargin),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: primaryTextColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category.name,
                    style: tertiaryTextStyle.copyWith(fontSize: 12),
                  ),
                  SizedBox(height: 6),
                  Text(
                    product.name,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semibold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 6),
                  Text(
                    'IDR${product.price}00',
                    style: priceTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
