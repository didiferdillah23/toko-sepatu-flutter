import 'package:flutter/material.dart';
import 'package:tokosepatu/models/cart_model.dart';
import 'package:tokosepatu/models/product_model.dart';
import 'dart:core';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];

  List<CartModel> get carts => _carts;

  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  addCart(ProductModel product) {
    if (productExist(product)) {
      int index =
          _carts.indexWhere((element) => element.product!.id == product.id);
      _carts[index].qty = _carts[index].qty! + 1;
    } else {
      _carts.add(
        CartModel(
          id: _carts.length,
          product: product,
          qty: 1,
        ),
      );
    }

    notifyListeners();
  }

  removeCart(int id) {
    int index = _carts.indexWhere((element) => element.product!.id == id);
    _carts.removeAt(index);
    notifyListeners();
  }

  addQty(int id) {
    int index = _carts.indexWhere((element) => element.product!.id == id);
    _carts[index].qty = _carts[index].qty! + 1;
    notifyListeners();
  }

  reduceQty(int id) {
    int index = _carts.indexWhere((element) => element.product!.id == id);

    _carts[index].qty = _carts[index].qty! - 1;
    if (_carts[index].qty! < 1) {
      _carts.removeAt(index);
    }
    notifyListeners();
  }

  totalItem() {
    int total = 0;
    for (var item in _carts) {
      total += item.qty!;
    }
    return total;
  }

  totalPrice() {
    double total = 0;
    for (var item in _carts) {
      total += (item.qty! * item.product!.price!.toDouble());
    }

    return total;
  }

  productExist(ProductModel product) {
    if (_carts.indexWhere((element) => element.product!.id == product.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }
}
