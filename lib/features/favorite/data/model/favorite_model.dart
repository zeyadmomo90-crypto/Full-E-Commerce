// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'favorite_model.g.dart';

@JsonSerializable()
class FavoriteModel {
  final int? id;
  final String? title;
  final List<String>? images;
  final int? price;
  final int? quantity;

  FavoriteModel({
    this.id,
    this.title,
    this.images,
    this.price,
    this.quantity = 1,
  });
  Map<String, dynamic> toJson() {
    final map = _$FavoriteModelToJson(this);
    if (images != null) {
      map['images'] = jsonEncode(images);
    }
    return map;
  }

  factory FavoriteModel.fromJson(Map<String, dynamic> map) {
    return FavoriteModel(
      id: map['id'],
      title: map['title'],
      price: map['price'],
      quantity: map['quantity'],
      images: map['images'] != null
          ? List<String>.from(jsonDecode(map['images']))
          : null,
    );
  }
}
