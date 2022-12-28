import 'package:flutter/material.dart';
import 'package:tokosepatu/models/product_model.dart';
import 'package:tokosepatu/screens/product_screen.dart';
import 'package:tokosepatu/theme.dart';

class ProductCard extends StatelessWidget {
  final ProductModel? product;
  ProductCard({this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductScreen(product)));
      },
      child: Container(
        width: 215,
        height: 278,
        margin: EdgeInsets.only(right: defaultMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffECEDEF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Image.network(
              product!.galleries!.first.url.toString(),
              width: 215,
              height: 150,
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product!.category!.name.toString(),
                    style: secondaryTextStyle.copyWith(fontSize: 12),
                  ),
                  SizedBox(height: 6),
                  Text(
                    product!.name.toString(),
                    style: blackTextStyle.copyWith(
                        fontSize: 18, fontWeight: semiBold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: 6),
                  Text(
                    '\$' + product!.price.toString(),
                    style: priceTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
