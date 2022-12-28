import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tokosepatu/providers/page_provider.dart';
import 'package:tokosepatu/screens/home/chat_screen.dart';
import 'package:tokosepatu/screens/home/home_screen.dart';
import 'package:tokosepatu/screens/home/profile_screen.dart';
import 'package:tokosepatu/screens/home/wishlist_screen.dart';
import 'package:tokosepatu/theme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        backgroundColor: secondaryColor,
        child: Image.asset('assets/cart_icon.png', width: 20),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 7,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              currentIndex: pageProvider.currentIndex,
              onTap: (value) {
                pageProvider.currentIndex = value;
              },
              backgroundColor: backgroundColor4,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Image.asset(
                      'assets/splash_icon.png',
                      width: 28,
                      color: pageProvider.currentIndex == 0
                          ? primaryColor
                          : Color(0xff808191),
                    ),
                  ),
                  label: ' ',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 15, right: 20),
                    child: Image.asset(
                      'assets/chat_icon.png',
                      width: 20,
                      color: pageProvider.currentIndex == 1
                          ? primaryColor
                          : Color(0xff808191),
                    ),
                  ),
                  label: ' ',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 15, left: 20),
                    child: Image.asset(
                      'assets/love_icon_grey.png',
                      width: 20,
                      color: pageProvider.currentIndex == 2
                          ? primaryColor
                          : Color(0xff808191),
                    ),
                  ),
                  label: ' ',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Image.asset(
                      'assets/profile_icon.png',
                      width: 18,
                      color: pageProvider.currentIndex == 3
                          ? primaryColor
                          : Color(0xff808191),
                    ),
                  ),
                  label: ' ',
                ),
              ]),
        ),
      );
    }

    Widget body() {
      switch (pageProvider.currentIndex) {
        case 0:
          return HomeScreen();
        case 1:
          return ChatScreen();
        case 2:
          return WishlistScreen();
        case 3:
          return ProfileScreen();
        default:
          return HomeScreen();
      }
    }

    return Scaffold(
      backgroundColor:
          pageProvider.currentIndex == 0 ? backgroundColor1 : backgroundColor3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
