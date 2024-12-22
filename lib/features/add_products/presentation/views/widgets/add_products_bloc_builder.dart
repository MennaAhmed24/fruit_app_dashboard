import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app_dashboard/core/widgets/custom_progress_hud.dart';
import 'package:fruit_app_dashboard/features/add_products/presentation/manager/cubit/add_products_cubit.dart';
import 'package:fruit_app_dashboard/features/add_products/presentation/views/widgets/add_product_view_body.dart';

class AddProductsViewBodyBlocBuilder extends StatelessWidget {
  const AddProductsViewBodyBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductsCubit, AddProductsState>(
        listener: (context, state) {
      if (state is AddProductsSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Product Added Successfully")));
      }
      if (state is AddProductsFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Product Adding Failed")));
      }
    }, builder: (context, state) {
      return CustomProgressHud(
          isLoading: state is AddProductsLoading,
          child: const AddProductViewBody());
    });
  }
}
