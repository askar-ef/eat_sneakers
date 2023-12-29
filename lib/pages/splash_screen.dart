import "dart:async";

import "package:eat_sneakers/providers/products_provider.dart";
import "package:eat_sneakers/theme.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getInit();

    // Provider.of<ProductProvider>(context).getProducts();

    Timer(
      Duration(seconds: 3),
      () => Navigator.pushNamed(context, '/sign-up'),
    );
    super.initState();
  }

  getInit() async {
    await Provider.of<ProductProvider>(context, listen: false).getProducts();
    //   Navigator.pushNamed(context, '/sign-in');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/image_logo.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
