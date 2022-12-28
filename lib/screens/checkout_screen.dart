import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tokosepatu/providers/auth_provider.dart';
import 'package:tokosepatu/providers/cart_provider.dart';
import 'package:tokosepatu/providers/transaction_provider.dart';
import 'package:tokosepatu/theme.dart';
import 'package:tokosepatu/widgets/checkout_card.dart';
import 'package:tokosepatu/widgets/loading_button.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleCheckout() async {
      setState(() {
        isLoading = true;
      });
      if (await transactionProvider.checkout(authProvider.user.token,
          cartProvider.carts, cartProvider.totalPrice())) {
        cartProvider.carts = [];
        Navigator.pushNamedAndRemoveUntil(
            context, '/checkout-success', (route) => false);
      }
      setState(() {
        isLoading = false;
      });
    }

    PreferredSize header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: backgroundColor1,
          centerTitle: true,
          title: Text('Checkout Details'),
          elevation: 0,
        ),
      );
    }

    Widget content() {
      return ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: [
          // NOTE : LIST ITEM
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'List Items',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                Column(
                    children: cartProvider.carts
                        .map(
                          (e) => CheckoutCard(e),
                        )
                        .toList()),
              ],
            ),
          ),
          // NOTE : ADDRESS DETAILS
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backgroundColor4,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Addess Details',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/from_location_icon.png',
                          width: 40,
                        ),
                        Image.asset(
                          'assets/line.png',
                          height: 30,
                        ),
                        Image.asset(
                          'assets/location_icon.png',
                          width: 40,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Store Location',
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                          ),
                        ),
                        Text(
                          'Rubik Store',
                          style: primaryTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Your Location',
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                          ),
                        ),
                        Text(
                          'Stabat, Indonesia',
                          style: primaryTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          //NOTE : PAYMENT SUMMERY
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backgroundColor4,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Summary',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Qty',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '${cartProvider.totalItem()} Item',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '\$${cartProvider.totalPrice()}',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shipping',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'Free',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Divider(
                  thickness: 1,
                  color: Color(0xff2E3141),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: priceTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      '\$${cartProvider.totalPrice()}',
                      style: priceTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          //NOTE : BUTTON CHECKOUT
          SizedBox(
            height: 30,
          ),
          Divider(
            thickness: .3,
            color: subtitleTextColor,
          ),
          isLoading
              ? Container(
                  margin: EdgeInsets.only(bottom: 30), child: LoadingButton())
              : Container(
                  height: 50,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: defaultMargin),
                  child: TextButton(
                    onPressed: handleCheckout,
                    style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Checkout Now',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ),
                )
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: content(),
    );
  }
}
