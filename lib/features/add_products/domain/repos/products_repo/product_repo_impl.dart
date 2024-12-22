import 'package:dartz/dartz.dart';
import 'package:fruit_app_dashboard/core/services/database_services.dart';
import 'package:fruit_app_dashboard/core/utilis/backend_endpoints.dart';
import 'package:fruit_app_dashboard/features/add_products/data/models/add_product_input.dart';
import 'package:fruit_app_dashboard/features/add_products/domain/repos/products_repo/product_repo.dart';
import 'package:fruit_app_dashboard/features/add_products/domain/entities/add_product_input_entity.dart';

import '../../../../../core/errors/failure.dart';

class ProductRepoImpl implements ProductRepo {
  final DatabaseService databaseService;

  ProductRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, void>> addProduct(
      AddProductInputEntity addProductInputEntity) async {
    try {
      await databaseService.addData(
        path: BackendEndpoints.addProduct,
        data: AddProductInputModel.fromEntity(addProductInputEntity).toJson(),
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: "Failed to add product"));
    }
  }
}
