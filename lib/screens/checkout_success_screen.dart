import 'package:flutter/material.dart';
import 'package:tokosepatu/theme.dart';

class CheckoutSuccessScreen extends StatelessWidget {
  const CheckoutSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSize header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: backgroundColor1,
          centerTitle: true,
          title: Text('Checkout Success'),
          elevation: 0,
        ),
      );
    }

    Widget content() {
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
              'You made a transaction',
              style: primaryTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                "Stay at home while we\nprepare your dream shoes.",
                style: secondaryTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 44,
              width: 200,
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
            SizedBox(height: 12),
            Container(
              height: 44,
              width: 200,
              child: TextButton(
                onPressed: null,
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  backgroundColor: backgroundColor5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'View My Order',
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

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: content(),
    );
  }
}
