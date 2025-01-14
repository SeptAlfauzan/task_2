import 'package:flutter/material.dart';
import 'package:task_2/src/modules/home/presentation/widgets/molecules/loader_item.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          2,
          (index) => const LoaderItem(),
        ).toList(),
      ),
    );
  }
}
