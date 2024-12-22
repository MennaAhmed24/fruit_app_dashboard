import 'package:fruit_app_dashboard/features/add_products/domain/repos/images_repo/image_repo.dart';
import 'package:fruit_app_dashboard/features/add_products/domain/repos/images_repo/image_repo_impl.dart';
import 'package:fruit_app_dashboard/core/services/firestore_services.dart';
import 'package:fruit_app_dashboard/features/add_products/domain/repos/products_repo/product_repo.dart';
import 'package:fruit_app_dashboard/features/add_products/domain/repos/products_repo/product_repo_impl.dart';
import 'package:fruit_app_dashboard/core/services/fire_storage_service.dart';
import 'package:fruit_app_dashboard/core/services/storage_service.dart';
import 'package:get_it/get_it.dart';

import '../services/database_services.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<DatabaseService>(FirestoreServices());
  getIt.registerSingleton<StorageService>(FireStorageService());
  getIt
      .registerSingleton<ImageRepo>(ImageRepoImpl(getIt.get<StorageService>()));
  getIt.registerSingleton<ProductRepo>(
      ProductRepoImpl(getIt.get<DatabaseService>()));
}
