import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tokosepatu/models/cart_model.dart';
import 'package:tokosepatu/providers/cart_provider.dart';
import 'package:tokosepatu/theme.dart';

class CartCard extends StatelessWidget {
  final CartModel? cart;
  CartCard(this.cart);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Container(
      margin: EdgeInsets.only(top: defaultMargin),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                        cart!.product!.galleries![0].url.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${cart!.product!.name}',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '\$${cart!.product!.price}',
                      style: priceTextStyle,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      cartProvider.addQty(cart!.product!.id!);
                    },
                    child: Icon(
                      Icons.add_circle,
                      size: 18,
                      color: primaryColor,
                    ),
                  ),
                  Text(
                    cart!.qty.toString(),
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  ),
                  GestureDetector(
                    onTap: () {
                      cartProvider.reduceQty(cart!.product!.id!);
                    },
                    child: Icon(
                      Icons.remove_circle,
                      size: 18,
                      color: subtitleTextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              cartProvider.removeCart(cart!.product!.id!);
            },
            child: Row(
              children: [
                Icon(
                  Icons.delete_forever,
                  color: alertColor,
                  size: 16,
                ),
                Text(
                  'Remove',
                  style: secondaryTextStyle.copyWith(color: alertColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
