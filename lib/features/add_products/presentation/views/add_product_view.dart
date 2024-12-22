import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app_dashboard/core/helper_functions/get_it.dart';
import 'package:fruit_app_dashboard/core/widgets/custom_app_bar.dart';
import 'package:fruit_app_dashboard/features/add_products/domain/repos/images_repo/image_repo.dart';
import 'package:fruit_app_dashboard/features/add_products/domain/repos/products_repo/product_repo.dart';
import 'package:fruit_app_dashboard/features/add_products/presentation/manager/cubit/add_products_cubit.dart';
import 'package:fruit_app_dashboard/features/add_products/presentation/views/widgets/add_products_bloc_builder.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const routeName = 'AddProductView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: "Add Product"),
      body: BlocProvider(
        create: (context) => AddProductsCubit(
          getIt.get<ImageRepo>(),
          getIt.get<ProductRepo>(),
        ),
        child: const AddProductsViewBodyBlocBuilder(),
      ),
    );
  }
}
