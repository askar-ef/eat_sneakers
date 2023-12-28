import 'package:eat_sneakers/theme.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        elevation: 0,
        title: Text(
          'Checkout Details',
          style: primaryTextStyle.copyWith(fontSize: 18),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'List Items',
            style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: backgroundColor4),
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
                        'Ultraboost Camo',
                        style: primaryTextStyle.copyWith(
                            fontSize: 14, fontWeight: semibold),
                      ),
                      Text(
                        'IDR2.700',
                        style: priceTextStyle.copyWith(
                            fontSize: 14, fontWeight: medium),
                      ),
                    ],
                  ),
                ),
                Text(
                  '2 Items',
                  style: secondaryTextStyle.copyWith(fontSize: 12),
                )
              ],
            ),
          ),

          // Address
          SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: backgroundColor4),
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address Details',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/icon_store_location.png',
                      width: 45,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Store Location',
                          style: secondaryTextStyle.copyWith(
                              fontSize: 12, fontWeight: light),
                        ),
                        Text(
                          'Adidas Core',
                          style: primaryTextStyle.copyWith(
                              fontSize: 14, fontWeight: semibold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/icon_your_address.png',
                      width: 45,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Address',
                          style: secondaryTextStyle.copyWith(
                              fontSize: 12, fontWeight: light),
                        ),
                        Text(
                          'Jakarta',
                          style: primaryTextStyle.copyWith(
                              fontSize: 14, fontWeight: semibold),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: backgroundColor4),
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Summary',
                  style: primaryTextStyle.copyWith(
                      fontSize: 18, fontWeight: medium),
                ),
                SizedBox(height: 12),
                // detail
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Quantity',
                      style: secondaryTextStyle.copyWith(
                          fontSize: 12, fontWeight: light),
                    ),
                    Text(
                      '2 Items',
                      style: primaryTextStyle.copyWith(
                          fontSize: 14, fontWeight: medium),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                // detail
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Quantity',
                      style: secondaryTextStyle.copyWith(
                          fontSize: 12, fontWeight: light),
                    ),
                    Text(
                      '2 Items',
                      style: primaryTextStyle.copyWith(
                          fontSize: 14, fontWeight: medium),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                // detail
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Quantity',
                      style: secondaryTextStyle.copyWith(
                          fontSize: 12, fontWeight: light),
                    ),
                    Text(
                      '2 Items',
                      style: primaryTextStyle.copyWith(
                          fontSize: 14, fontWeight: medium),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Divider(
                  thickness: 0.3,
                  color: tertiaryTextColor,
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: priceTextStyle.copyWith(
                          fontSize: 14, fontWeight: semibold),
                    ),
                    Text(
                      'IDR5.400',
                      style: priceTextStyle.copyWith(
                          fontSize: 14, fontWeight: semibold),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      );
    }

    Widget customBottomNav() {
      return Container(
        height: 200,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(defaultMargin),
              child: Column(
                children: [
                  Divider(
                    thickness: 0.2,
                    color: priceColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: primaryColor),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/checkout-success', (route) => false);
                        },
                        child: Text(
                          'Checkout Now',
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
