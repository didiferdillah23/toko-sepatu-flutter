import 'package:tokosepatu/models/category_model.dart';
import 'package:tokosepatu/models/gallery_model.dart';

class ProductModel {
  int? id;
  String? name, description, tags;
  double? price;
  CategoryModel? category;
  DateTime? createdAt, updatedAt;
  List<GalleryModel>? galleries;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.tags,
    this.price,
    this.category,
    // this.createdAt,
    // this.updatedAt,
    this.galleries,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    tags = json['tags'];
    price = double.parse(json['price'].toString());
    category = CategoryModel.fromJson(json['category']);
    galleries = json['galleries']
        .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
        .toList();
    // createdAt = DateTime.parse(json['created_at']);
    // updatedAt = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'tags': tags,
      'category': category!.toJson(),
      'galleries': galleries!.map((gallery) => gallery.toJson()).toList(),
      // 'createdAt': createdAt.toString(),
      // 'updatedAt': updatedAt.toString(),
    };
  }
}

class UninitializedProductModel extends ProductModel {}
