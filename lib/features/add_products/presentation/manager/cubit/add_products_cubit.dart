import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:fruit_app_dashboard/features/add_products/domain/repos/images_repo/image_repo.dart';
import 'package:fruit_app_dashboard/features/add_products/domain/repos/products_repo/product_repo.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/add_product_input_entity.dart';

part 'add_products_state.dart';

class AddProductsCubit extends Cubit<AddProductsState> {
  AddProductsCubit(this.imageRepo, this.productRepo)
      : super(AddProductsInitial());

  final ImageRepo imageRepo;
  final ProductRepo productRepo;

  Future<void> addProduct(AddProductInputEntity addProductInputEntity) async {
    emit(AddProductsLoading());
    var result = await imageRepo.uploadImage(addProductInputEntity.image);
    result.fold((failure) {
      emit(AddProductsFailure(errMessage: failure.message));
    }, (imageUrl) async {
      addProductInputEntity.imageUrl = imageUrl;
      var result = await productRepo.addProduct(addProductInputEntity);
      result.fold((failure) {
        emit(AddProductsFailure(errMessage: failure.message));
      }, (r) {
        emit(AddProductsSuccess());
      });
    });
  }
}
