import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tokosepatu/models/user_model.dart';
import 'package:tokosepatu/providers/auth_provider.dart';
import 'package:tokosepatu/providers/product_provider.dart';
import 'package:tokosepatu/theme.dart';
import 'package:tokosepatu/widgets/product_cards.dart';
import 'package:tokosepatu/widgets/product_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Halo, ${user.name}',
                    style: primaryTextStyle.copyWith(
                        fontSize: 24, fontWeight: semiBold),
                  ),
                  Text('@${user.username}',
                      style: subtitleTextStyle.copyWith(fontSize: 16)),
                ],
              ),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(user.profilePhotoUrl!),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget categories() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          child: Row(
            children: [
              SizedBox(width: defaultMargin),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: primaryColor,
                ),
                margin: EdgeInsets.only(right: 16),
                child: Text(
                  'All Products',
                  style: primaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.transparent,
                  border: Border.all(color: subtitleTextColor),
                ),
                margin: EdgeInsets.only(right: 16),
                child: Text(
                  'Running',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.transparent,
                  border: Border.all(color: subtitleTextColor),
                ),
                margin: EdgeInsets.only(right: 16),
                child: Text(
                  'Training',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.transparent,
                  border: Border.all(color: subtitleTextColor),
                ),
                margin: EdgeInsets.only(right: 16),
                child: Text(
                  'Basketball',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.transparent,
                  border: Border.all(color: subtitleTextColor),
                ),
                margin: EdgeInsets.only(right: 16),
                child: Text(
                  'Hiking',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget popularProductsTitle() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Text(
          'Popular Products',
          style: primaryTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 22,
          ),
        ),
      );
    }

    Widget popularProducts() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          child: Row(
            children: [
              SizedBox(width: defaultMargin),
              Row(
                children: productProvider.products
                    .map((e) => ProductCard(
                          product: e,
                        ))
                    .toList(),
              )
            ],
          ),
        ),
      );
    }

    Widget newArrivalsTitle() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Text(
          'New Arrivals',
          style: primaryTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 22,
          ),
        ),
      );
    }

    Widget newArrivals() {
      return Container(
        margin: EdgeInsets.only(
          top: 15,
        ),
        child: Column(
          children: productProvider.products
              .map((e) => ProductTile(
                    product: e,
                  ))
              .toList(),
        ),
      );
    }

    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        header(),
        categories(),
        popularProductsTitle(),
        popularProducts(),
        newArrivalsTitle(),
        newArrivals(),
      ],
    );
  }
}
