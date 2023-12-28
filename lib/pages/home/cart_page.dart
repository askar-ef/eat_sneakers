import 'package:eat_sneakers/pages/home/checkout_page.dart';
import 'package:eat_sneakers/pages/widget/cart_card.dart';
import 'package:eat_sneakers/theme.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          'Your Cart',
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyCart() {
      return Expanded(
          child: Container(
        width: double.infinity,
        color: backgroundColor3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_empty_cart.png',
              width: 74,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'You don\'t have dream shoes?',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const SizedBox(height: 12),
            Text(
              'Let\'s find your favorite shoes',
              style: tertiaryTextStyle.copyWith(fontSize: 14),
            ),
            const SizedBox(height: 20),
            Container(
              height: 44,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout-success');
                },
                style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 24, vertical: 10)),
                child: Text(
                  'Explore Store',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
              ),
            )
          ],
        ),
      ));
    }

    Widget content() {
      return Expanded(
        child: ListView(
          padding:
              EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 15),
          children: [CartCard()],
        ),
      );
    }

    Widget customBottomNav() {
      return Container(
        height: 180,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: primaryTextStyle.copyWith(fontSize: 14),
                  ),
                  Text(
                    'IDR2.700',
                    style: priceTextStyle.copyWith(
                        fontSize: 16, fontWeight: semibold),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(defaultMargin),
              child: Column(
                children: [
                  Divider(
                    thickness: 0.2,
                    color: priceColor,
                  ),
                  SizedBox(
                    height: defaultMargin,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: primaryColor),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/checkout');
                        },
                        child: Text(
                          'Continue to Checkout',
                          style: primaryTextStyle.copyWith(
                              fontSize: 16, fontWeight: semibold),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: content(),
      bottomNavigationBar: customBottomNav(),
    );
  }
}
