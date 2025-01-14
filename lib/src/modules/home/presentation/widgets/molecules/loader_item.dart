import 'package:flutter/material.dart';
import 'package:task_2/src/modules/home/presentation/widgets/atoms/shimmer_loader.dart';

class LoaderItem extends StatelessWidget {
  const LoaderItem({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const paddingSize = 16.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 400,
          width: screenWidth,
          padding: const EdgeInsets.all(paddingSize),
          child: ShimmerLoader(
            isLoading: true,
            child: Container(
              color: Colors.grey,
              height: 400,
              width: screenWidth,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingSize),
          child: ShimmerLoader(
              isLoading: true,
              child: Container(
                color: Colors.grey,
                width: 100,
                height: 24,
              )),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingSize),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShimmerLoader(
                isLoading: true,
                child: Container(
                  color: Colors.grey,
                  height: 12,
                  width: 120,
                ),
              ),
              ShimmerLoader(
                isLoading: true,
                child: Container(
                  color: Colors.grey,
                  height: 12,
                  width: 80,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingSize),
          child: ShimmerLoader(
            isLoading: true,
            child: Container(
              color: Colors.grey,
              height: 12,
              width: 200,
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
