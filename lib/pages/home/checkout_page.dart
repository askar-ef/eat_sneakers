import 'package:eat_sneakers/pages/widget/checkout_card.dart';
import 'package:eat_sneakers/providers/auth_provider.dart';
import 'package:eat_sneakers/providers/cart_provider.dart';
import 'package:eat_sneakers/providers/transaction_provider.dart';
import 'package:eat_sneakers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleCheckout() async {
      if (authProvider.user.token != null) {
        if (await transactionProvider.checkout(authProvider.user.token!,
            cartProvider.carts, cartProvider.totalPrice())) {
          cartProvider.carts = [];
          Navigator.pushNamedAndRemoveUntil(
              context, '/checkout-success', (route) => false);
        }
      }
    }

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
          Column(
              children: cartProvider.carts
                  .map((cart) => CheckoutCard(cart))
                  .toList()),

          // Address
          SizedBox(
            height: 20,
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
                      '${cartProvider.totalItems()} Items',
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
                      'Product Price',
                      style: secondaryTextStyle.copyWith(
                          fontSize: 12, fontWeight: light),
                    ),
                    Text(
                      'IDR${cartProvider.totalPrice()}00',
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
                      'Shipping',
                      style: secondaryTextStyle.copyWith(
                          fontSize: 12, fontWeight: light),
                    ),
                    Text(
                      'Free',
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
                      'IDR${cartProvider.totalPrice()}00',
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
        height: 110,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: defaultMargin,
                  right: defaultMargin,
                  bottom: defaultMargin),
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
                          handleCheckout();
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
