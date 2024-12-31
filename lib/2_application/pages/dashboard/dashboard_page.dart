import 'package:flutter/material.dart';
import 'package:web_demo/2_application/core/page_config.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static const pageConfig = PageConfig(
      icon: Icons.dashboard_customize_outlined,
      name: 'dashboard',
      child: DashboardPage());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurpleAccent,
    );
  }
}
