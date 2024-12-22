part of 'add_products_cubit.dart';

@immutable
sealed class AddProductsState {}

final class AddProductsInitial extends AddProductsState {}

final class AddProductsLoading extends AddProductsState {}

final class AddProductsFailure extends AddProductsState {
  final String errMessage;

  AddProductsFailure({required this.errMessage});
}

final class AddProductsSuccess extends AddProductsState {}
