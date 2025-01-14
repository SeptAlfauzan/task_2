import 'package:flutter/material.dart';
import 'package:task_2/src/modules/home/domain/entities/product.dart';
import 'package:task_2/src/modules/home/presentation/widgets/atoms/image_carousell.dart';

class CardProduct extends StatefulWidget {
  final Product product;
  const CardProduct({super.key, required this.product});

  @override
  State<CardProduct> createState() => _CardProductState();
}

class _CardProductState extends State<CardProduct> {
  @override
  Widget build(BuildContext context) {
    const paddingSize = 16.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ImageCarousell(imageUrls: widget.product.images),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingSize),
          child: Text(
            widget.product.title,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingSize),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Rp${widget.product.price}",
                style: const TextStyle(
                    color: Colors.pink, fontWeight: FontWeight.w700),
              ),
              Text(widget.product.category.name),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingSize),
          child: Text(
            widget.product.description,
            style: const TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
