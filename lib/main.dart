import "package:eat_sneakers/pages/home/main_page.dart";
import "package:eat_sneakers/pages/sign_in_page.dart";
import "package:eat_sneakers/pages/sign_up_page.dart";
import "package:eat_sneakers/pages/splash_screen.dart";
import "package:flutter/material.dart";

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/home': (context) => MainPage(),
      },
    );
  }
}