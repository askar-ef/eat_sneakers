import "package:eat_sneakers/theme.dart";
import "package:flutter/material.dart";

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'Wishlist Page',
      style: primaryTextStyle.copyWith(fontSize: 20),
    ));
  }
}
