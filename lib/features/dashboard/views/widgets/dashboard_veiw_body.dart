import 'package:flutter/material.dart';
import 'package:fruit_app_dashboard/core/widgets/custom_button_widget.dart';
import 'package:fruit_app_dashboard/features/add_products/presentation/views/add_product_view.dart';

class DashboardVeiwBody extends StatelessWidget {
  const DashboardVeiwBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButtonWidget(
            text: "Add Data",
            onPressed: () {
              Navigator.pushNamed(context, AddProductView.routeName);
            })
      ],
    );
  }
}
