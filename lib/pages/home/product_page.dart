// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:eat_sneakers/models/product_model.dart';
import 'package:eat_sneakers/pages/home/detail_chat_page.dart';
import 'package:eat_sneakers/providers/cart_provider.dart';
import 'package:eat_sneakers/providers/wishlist_provider.dart';
import 'package:eat_sneakers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  final ProductModel product;
  ProductPage(this.product);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // const ProductPage({super.key});

  List image = [
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
  ];

  List familiarShoes = [
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    Future<void> showSuccessDialog() async {
      return showDialog(
          context: context,
          builder: (BuildContext context) => Container(
                width: MediaQuery.of(context).size.width - (2 * defaultMargin),
                child: AlertDialog(
                  backgroundColor: backgroundColor3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  content: SingleChildScrollView(
                      child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close,
                            color: primaryTextColor,
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/icon_success.png',
                        width: 100,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Hurray :)',
                        style: primaryTextStyle.copyWith(
                            fontSize: 18, fontWeight: semibold),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Item added successfully',
                        style: secondaryTextStyle.copyWith(
                            fontSize: 14, fontWeight: semibold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/cart');
                          },
                          child: Text(
                            'View My Cart',
                            style: primaryTextStyle.copyWith(fontSize: 16),
                          ),
                          style: TextButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              )),
                        ),
                      )
                    ],
                  )),
                ),
              ));
    }

    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 16 : 4,
        height: 4,
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: currentIndex == index ? primaryColor : secondaryTextColor),
      );
    }

    Widget familiarShoesCard(String imageUrl) {
      return Container(
        width: 54,
        height: 54,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(
                image: AssetImage(imageUrl), fit: BoxFit.cover)),
      );
    }

    Widget header() {
      int index = -1;
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: 20, left: defaultMargin, right: defaultMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.chevron_left,
                  ),
                ),
                GestureDetector(
                  child: Icon(Icons.shopping_bag),
                )
              ],
            ),
          ),
          CarouselSlider(
              items: image
                  .map((image) => Image.asset(
                        image,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ))
                  .toList(),
              options: CarouselOptions(
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  })),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: image.map((e) {
              index++;
              return indicator(index);
            }).toList(),
          )
        ],
      );
    }

    Widget content() {
      int index = -1;
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 17),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            color: backgroundColor1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.product.name,
                              style: primaryTextStyle.copyWith(
                                  fontSize: 18, fontWeight: semibold),
                            ),
                            Text(
                              widget.product.category.name,
                              style: secondaryTextStyle.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          wishlistProvider.setProduct(widget.product);
                          if (wishlistProvider.isWishlist(widget.product)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: secondaryColor,
                                content: Text(
                                  'Has been added to wishlist',
                                  style: primaryTextStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: alertColor,
                                content: Text(
                                  'has been removed from the wishlist',
                                  style: primaryTextStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }
                        },
                        child: Image.asset(
                          wishlistProvider.isWishlist(widget.product)
                              ? 'assets/button_wishlist_blue.png'
                              : 'assets/button_wishlist_grey.png',
                          width: 46,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: backgroundColor3,
                        borderRadius: BorderRadius.circular(4)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Price starts from',
                          style: primaryTextStyle,
                        ),
                        Text(
                          'IDR${widget.product.price}00',
                          style: priceTextStyle.copyWith(
                              fontSize: 16, fontWeight: semibold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: primaryTextStyle.copyWith(fontWeight: medium),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        widget.product.description,
                        style: tertiaryTextStyle.copyWith(fontWeight: light),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Familiar Shoes',
                        style: primaryTextStyle.copyWith(fontWeight: medium),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: familiarShoes.map((images) {
                  index++;
                  return Container(
                    margin: EdgeInsets.only(
                      left: index == 0 ? 30 : 0,
                    ),
                    child: familiarShoesCard(images),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.all(defaultMargin),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, '/detail-chat');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailChatPage(widget.product)));
                    },
                    child: Image.asset(
                      'assets/button_chat.png',
                      width: 54,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      height: 54,
                      child: TextButton(
                        onPressed: () {
                          cartProvider.addCarts(widget.product);
                          showSuccessDialog();
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        child: Text(
                          'Add to Cart',
                          style:
                              primaryTextStyle.copyWith(fontWeight: semibold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0XFFECEDEF),
      body: ListView(
        children: [header(), content()],
      ),
    );
  }
}
