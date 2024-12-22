import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_app_dashboard/core/utilis/backend_endpoints.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/storage_service.dart';
import 'image_repo.dart';

class ImageRepoImpl implements ImageRepo {
  final StorageService storageService;

  ImageRepoImpl(this.storageService);
  @override
  Future<Either<Failure, String>> uploadImage(File imageFile) async {
    try {
      String url =
          await storageService.uploadFile(imageFile, BackendEndpoints.images);

      return Right(url);
    } on Exception catch (e) {
      return Left(ServerFailure(message: "Failed to upload image"));
    }
  }
}
