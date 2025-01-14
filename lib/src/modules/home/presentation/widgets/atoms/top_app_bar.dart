import 'package:flutter/material.dart';

PreferredSizeWidget topAppBar() {
  return AppBar(
    surfaceTintColor: Colors.white,
    backgroundColor: Colors.white,
    title: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(Icons.shopping_bag_outlined),
      SizedBox(width: 8),
      Text("La Shopping")
    ]),
  );
}
