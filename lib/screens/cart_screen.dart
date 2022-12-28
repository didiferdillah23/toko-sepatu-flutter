import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tokosepatu/providers/cart_provider.dart';
import 'package:tokosepatu/theme.dart';
import 'package:tokosepatu/widgets/cart_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    PreferredSize header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: backgroundColor1,
          centerTitle: true,
          title: Text('Your Cart'),
          elevation: 0,
        ),
      );
    }

    Widget emptyCart() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/add_cart_icon.png',
              width: 80,
            ),
            SizedBox(height: 20),
            Text(
              'Your Cart is Empty',
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
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
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
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        physics: BouncingScrollPhysics(),
        children: cartProvider.carts.map((e) => CartCard(e)).toList(),
      );
    }

    Widget customBottomNav() {
      return Container(
        height: 180,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: primaryTextStyle,
                  ),
                  Text(
                    '\$${cartProvider.totalPrice()}',
                    style: priceTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              thickness: .3,
              color: subtitleTextColor,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout');
                },
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Continue to Checkout',
                        style: primaryTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                      Icon(
                        Icons.arrow_right_alt,
                        color: primaryTextColor,
                      ),
                    ]),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: (cartProvider.carts.length > 0) ? content() : emptyCart(),
      bottomNavigationBar:
          (cartProvider.carts.length > 0) ? customBottomNav() : null,
    );
  }
}
