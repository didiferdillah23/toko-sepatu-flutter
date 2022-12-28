import 'package:flutter/material.dart';
import 'package:tokosepatu/models/product_model.dart';
import 'package:tokosepatu/screens/product_screen.dart';
import 'package:tokosepatu/theme.dart';

class ProductTile extends StatelessWidget {
  final ProductModel? product;
  ProductTile({this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductScreen(product)));
      },
      child: Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          bottom: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                product!.galleries![1].url.toString(),
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product!.category!.name.toString(),
                    style: secondaryTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    product!.name.toString(),
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 6),
                  Text(
                    '\$${product!.price}',
                    style: priceTextStyle.copyWith(
                      fontWeight: medium,
                    ),
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
