import "package:eat_sneakers/pages/widget/product_card.dart";
import "package:eat_sneakers/theme.dart";
import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Halo, Alex",
                    style: primaryTextStyle.copyWith(
                        fontSize: 24, fontWeight: semibold),
                  ),
                  Text(
                    "Alex Keim",
                    style: tertiaryTextStyle.copyWith(fontSize: 16),
                  )
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/icon_profile.png'),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget categories() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: defaultMargin),
              Container(
                margin: EdgeInsets.only(right: 12),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: primaryColor,
                ),
                child: Text(
                  'All Shoes',
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 12),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: tertiaryTextColor),
                  color: Colors.transparent,
                ),
                child: Text(
                  'Running',
                  style: tertiaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 12),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: tertiaryTextColor),
                  color: Colors.transparent,
                ),
                child: Text(
                  'Basketball',
                  style: tertiaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 12),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: tertiaryTextColor),
                  color: Colors.transparent,
                ),
                child: Text(
                  'Tennis',
                  style: tertiaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 12),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: tertiaryTextColor),
                  color: Colors.transparent,
                ),
                child: Text(
                  'Hiking',
                  style: tertiaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 12),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: tertiaryTextColor),
                  color: Colors.transparent,
                ),
                child: Text(
                  'Futsal',
                  style: tertiaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget popularProductsTitle() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, right: defaultMargin, left: defaultMargin),
        child: Text(
          "Popular Products",
          style: primaryTextStyle.copyWith(fontSize: 22, fontWeight: semibold),
        ),
      );
    }

    Widget popularProducts() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(
                children: [ProductCard(), ProductCard()],
              )
            ],
          ),
        ),
      );
    }

    return ListView(
      children: [
        header(),
        categories(),
        popularProductsTitle(),
        popularProducts()
      ],
    );
  }
}
