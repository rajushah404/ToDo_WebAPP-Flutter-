import 'package:flutter/material.dart';

class TodoOverviewLodaing extends StatelessWidget {
  const TodoOverviewLodaing({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator.adaptive();
  }
}
