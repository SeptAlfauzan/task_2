import 'package:flutter/material.dart';
import 'package:task_2/src/modules/home/domain/entities/product.dart';
import 'package:task_2/src/modules/home/presentation/widgets/molecules/card_product.dart';
import 'package:task_2/src/modules/home/presentation/widgets/atoms/no_data.dart';
import 'package:task_2/src/modules/home/presentation/widgets/molecules/loader.dart';

class HomeContent extends StatelessWidget {
  final bool hasData;
  final bool isLoading;
  final List<Product> products;
  final Function onRefresh;
  const HomeContent(
      {super.key,
      required this.hasData,
      required this.isLoading,
      required this.products,
      required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await onRefresh();
      },
      child: isLoading || !hasData
          ? const Loader()
          : products.isEmpty
              ? TextWithButtonAction(
                  text: "No data loaded",
                  actionName: "Refresh",
                  onTap: () async {
                    await onRefresh();
                  },
                )
              : ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: CardProduct(
                        product: products[index],
                      ),
                    );
                  },
                ),
    );
  }
}
