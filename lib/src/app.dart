import 'package:flutter/material.dart';
import 'package:task_2/src/modules/home/presentation/home_view.dart';
import 'package:task_2/src/ui/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const HomeView(),
    );
  }
}
