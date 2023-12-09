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
        onPressed: () {},
        backgroundColor: secondaryColor,
        child: Image.asset(
          'assets/icon_cart.png',
          width: 20,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45),
        ));
  }

  Widget customBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor4, // Warna latar belakang
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [], // Menghilangkan bayangan
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
            icon: Image.asset(
              'assets/icon_home.png',
              width: 22,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icon_chat.png',
              width: 22,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icon_wishlist.png',
              width: 22,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icon_profile.png',
              width: 22,
            ),
            label: '',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Center(child: Text('Main Page')),
      bottomNavigationBar: customBottomNav(),
    );
  }
}
