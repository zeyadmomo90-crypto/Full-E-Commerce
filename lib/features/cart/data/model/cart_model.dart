import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'cart_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CartModel {
  final int? id;
  final String? title;
  final int? price;
  final List<String>? images;
  final int? quantity;

  CartModel({this.id, this.title, this.price, this.images, this.quantity});

  Map<String, dynamic> toJson() {
    final map = _$CartModelToJson(this);
    if (images != null) {
      map['images'] = jsonEncode(images);
    }
    return map;
  }

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      quantity: json['quantity'],
      images: json['images'] != null
          ? List<String>.from(jsonDecode(json['images']))
          : null,
    );
  }
}
