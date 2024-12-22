import 'package:flutter/material.dart';
import 'package:fruit_app_dashboard/features/add_products/presentation/views/add_product_view.dart';
import 'package:fruit_app_dashboard/features/dashboard/views/dashboard_view.dart';

Route<dynamic> OnGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {


      case DashboardView.routeName:
      return MaterialPageRoute(builder: (context) => const DashboardView());

      case AddProductView.routeName:
      return MaterialPageRoute(builder: (context) => const AddProductView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
