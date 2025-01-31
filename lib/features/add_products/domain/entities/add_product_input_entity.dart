import 'dart:io';

class AddProductInputEntity {
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

  AddProductInputEntity(
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
}
