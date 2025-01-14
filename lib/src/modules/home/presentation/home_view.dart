import 'package:flutter/material.dart';
import 'package:task_2/src/modules/home/data/repositories/products_repository_impl.dart';
import 'package:task_2/src/modules/home/domain/entities/product.dart';
import 'package:task_2/src/modules/home/presentation/widgets/atoms/no_data.dart';
import 'package:task_2/src/modules/home/presentation/widgets/atoms/top_app_bar.dart';
import 'package:task_2/src/modules/home/presentation/widgets/organism/home_content.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final repository = ProductsRepositoryImpl();
  late Future<List<Product>> _future;
  bool _isRefreshing = false;

  @override
  void initState() {
    super.initState();
    _future = repository.getProducts();
  }

  Future<void> _refresh() async {
    setState(() {
      _isRefreshing = true;
    });

    try {
      await repository.getProducts();
      setState(() {
        _future = repository.getProducts();
        _isRefreshing = false;
      });
    } catch (e) {
      setState(() {
        _isRefreshing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: topAppBar(),
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return TextWithButtonAction(
              text: 'Error: ${snapshot.error}',
              onTap: () async {
                _refresh();
              },
              actionName: "Refresh",
            );
          }
          return HomeContent(
            hasData: snapshot.hasData,
            isLoading: _isRefreshing,
            products: snapshot.data ?? [],
            onRefresh: () async {
              await _refresh();
            },
          );
        },
      ),
    );
  }
}
