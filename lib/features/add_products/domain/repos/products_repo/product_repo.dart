import 'package:dartz/dartz.dart';
import 'package:fruit_app_dashboard/features/add_products/domain/entities/add_product_input_entity.dart';

import '../../../../../core/errors/failure.dart';

abstract class ProductRepo {
  Future<Either<Failure, void>> addProduct(AddProductInputEntity addProductInputEntity);
}