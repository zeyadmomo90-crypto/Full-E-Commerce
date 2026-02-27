// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  CartModel({this.id, this.title, this.price, this.images, this.quantity = 1});

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

  CartModel copyWith({
    int? id,
    String? title,
    int? price,
    List<String>? images,
    int? quantity,
  }) {
    return CartModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      images: images ?? this.images,
      quantity: quantity ?? this.quantity,
    );
  }
}
