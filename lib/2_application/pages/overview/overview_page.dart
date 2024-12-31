import 'package:flutter/material.dart';
import 'package:web_demo/2_application/core/page_config.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  static const pageConfig = PageConfig(
      icon: Icons.work_history_outlined,
      name: 'overview',
      child: OverviewPage());
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.tealAccent,
    );
  }
}
