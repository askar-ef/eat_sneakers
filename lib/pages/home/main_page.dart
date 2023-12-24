import "package:eat_sneakers/pages/home/chat_page.dart";
import "package:eat_sneakers/pages/home/home_page.dart";
import "package:eat_sneakers/pages/home/profile_page.dart";
import "package:eat_sneakers/pages/home/wishlist_page.dart";
import "package:eat_sneakers/theme.dart";
import "package:flutter/material.dart";

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  Widget cartButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, '/cart');
      },
      backgroundColor: secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(45),
      ),
      child: Image.asset(
        'assets/icon_cart.png',
        width: 20,
      ),
    );
  }

  Widget customBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          print(value);
          setState(() {
            currentIndex = value;
          });
        },
        backgroundColor: backgroundColor4,
        type: BottomNavigationBarType.fixed,
        iconSize: 20,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icon_home.png',
                width: 22,
                color: currentIndex == 0 ? primaryColor : tertiaryTextColor),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icon_chat.png',
                width: 22,
                color: currentIndex == 1 ? primaryColor : tertiaryTextColor),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icon_wishlist.png',
                width: 22,
                color: currentIndex == 3 ? primaryColor : tertiaryTextColor),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icon_profile.png',
                width: 22,
                color: currentIndex == 4 ? primaryColor : tertiaryTextColor),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return ChatPage();
      case 2:
        return ChatPage();
      case 3:
        return WishlistPage();
      case 4:
        return ProfilePage();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: body(),
      bottomNavigationBar: customBottomNav(),
    );
  }
}
