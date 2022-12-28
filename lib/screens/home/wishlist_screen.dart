import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tokosepatu/providers/page_provider.dart';
import 'package:tokosepatu/providers/wishlist_provider.dart';
import 'package:tokosepatu/theme.dart';
import 'package:tokosepatu/widgets/wishlist_card.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          'Wishlist',
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyWishlist() {
      return Expanded(
        child: Container(
          color: backgroundColor3,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/love_icon_blue.png',
                width: 80,
              ),
              SizedBox(height: 20),
              Text(
                'You don`t have whislist product',
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "Let`s find awesome produts for you",
                  style: secondaryTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 44,
                child: TextButton(
                  onPressed: () {
                    pageProvider.currentIndex = 0;
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Explore Rubik Store',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          color: backgroundColor3,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            physics: BouncingScrollPhysics(),
            children:
                wishlistProvider.wishlist.map((e) => WishlistCard(e)).toList(),
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        wishlistProvider.wishlist.length == 0 ? emptyWishlist() : content(),
      ],
    );
  }
}
