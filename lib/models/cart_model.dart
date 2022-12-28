import 'package:tokosepatu/models/product_model.dart';

class CartModel {
  int? id;
  ProductModel? product;
  int? qty;

  CartModel({
    this.id,
    this.product,
    this.qty,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = ProductModel.fromJson(json['product']);
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product!.toJson(),
      'qty': qty,
    };
  }

  double getTotalPrice() {
    return product!.price! * qty!.toDouble();
  }
}
