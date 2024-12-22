import 'dart:io';

import 'package:fruit_app_dashboard/features/add_products/domain/entities/add_product_input_entity.dart';

class AddProductInputModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating = 0;
  final ratingCount = 0;
  final int unitAmount;

  AddProductInputModel(
      {required this.name,
      required this.code,
      required this.description,
      required this.price,
      required this.expirationsMonths,
      required this.numberOfCalories,
      required this.unitAmount,
      required this.isOrganic,
      required this.image,
      required this.isFeatured,
      this.imageUrl});

  factory AddProductInputModel.fromEntity(
      AddProductInputEntity addProductInputEntity) {
    return AddProductInputModel(
      name: addProductInputEntity.name,
      code: addProductInputEntity.code,
      description: addProductInputEntity.description,
      price: addProductInputEntity.price,
      expirationsMonths: addProductInputEntity.expirationsMonths,
      numberOfCalories: addProductInputEntity.numberOfCalories,
      unitAmount: addProductInputEntity.unitAmount,
      isOrganic: addProductInputEntity.isOrganic,
      image: addProductInputEntity.image,
      isFeatured: addProductInputEntity.isFeatured,
      imageUrl: addProductInputEntity.imageUrl,
    );
  }

  toJson() {
    return {
      "name": name,
      "code": code,
      "description": description,
      "price": price,
      "expirationsMonths": expirationsMonths,
      "numberOfCalories": numberOfCalories,
      "unitAmount": unitAmount,
      "isOrganic": isOrganic,
      "isFeatured": isFeatured,
      "imageUrl": imageUrl,
    };
  }
}
