import 'package:eat_sneakers/models/product_model.dart';
import 'package:eat_sneakers/pages/home/product_page.dart';
import 'package:eat_sneakers/theme.dart';
import 'package:flutter/material.dart';

class ProductArrival extends StatelessWidget {
  // const ProductArrival({super.key});

  final ProductModel product;
  ProductArrival(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductPage(product)));
      },
      child: Container(
        margin: EdgeInsets.only(
            left: defaultMargin, right: defaultMargin, bottom: defaultMargin),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/image_shoes.png',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category.name,
                    style: tertiaryTextStyle.copyWith(fontSize: 12),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    product.name,
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: semibold),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'IDR${product.price}00',
                    style: priceTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium),
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
