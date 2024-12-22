import 'package:flutter/material.dart';
import 'package:fruit_app_dashboard/features/dashboard/views/widgets/dashboard_veiw_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});
static const routeName = 'DashboardView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:DashboardVeiwBody(),
    );
  }
}