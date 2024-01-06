// ignore_for_file: prefer_const_constructors

import "package:eat_sneakers/pages/home/cart_page.dart";
import "package:eat_sneakers/pages/home/checkout_page.dart";
import "package:eat_sneakers/pages/home/checkout_success_page.dart";
import "package:eat_sneakers/pages/home/detail_chat_page.dart";
import "package:eat_sneakers/pages/home/edit_profile_page.dart";
import "package:eat_sneakers/pages/home/main_page.dart";
import "package:eat_sneakers/pages/home/product_page.dart";
import "package:eat_sneakers/pages/sign_in_page.dart";
import "package:eat_sneakers/pages/sign_up_page.dart";
import "package:eat_sneakers/pages/splash_screen.dart";
import "package:eat_sneakers/providers/auth_provider.dart";
import "package:eat_sneakers/providers/cart_provider.dart";
import "package:eat_sneakers/providers/products_provider.dart";
import "package:eat_sneakers/providers/transaction_provider.dart";
import "package:eat_sneakers/providers/wishlist_provider.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

void main() => runApp(const MyApp());

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(create: (context) => TransactionProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreen(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          // '/detail-chat': (context) => DetailChatPage(),
          '/edit-profile': (context) => EditProfilePage(),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkout-success': (context) => CheckoutSuccessPage(),
        },
      ),
    );
  }
}
