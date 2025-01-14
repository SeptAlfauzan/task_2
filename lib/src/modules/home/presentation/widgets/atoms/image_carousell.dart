import 'package:flutter/material.dart';
import 'package:task_2/src/extension/list_widget_extension.dart';

class ImageCarousell extends StatefulWidget {
  final List<String> imageUrls;
  const ImageCarousell({super.key, required this.imageUrls});

  @override
  State<ImageCarousell> createState() => _ImageCarousellState();
}

class _ImageCarousellState extends State<ImageCarousell> {
  final _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  int activePage = 0;
  @override
  Widget build(BuildContext context) {
    const marginSize = 4.0;

    return Stack(
      children: [
        SizedBox(
          height: 400,
          child: PageView.builder(
            itemCount: widget.imageUrls.length,
            pageSnapping: true,
            controller: _pageController,
            onPageChanged: (page) {
              setState(() {
                activePage = page;
              });
            },
            itemBuilder: (context, pagePosition) {
              return Container(
                margin: const EdgeInsets.all(marginSize),
                child: Image.network(
                  widget.imageUrls[pagePosition],
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.image, color: Colors.grey),
                          Text("Image can't be loaded!")
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
        Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: ImageCarousellIndicator(
              onTap: (index) async {
                await _pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.bounceIn);
              },
              activePage: activePage,
              length: widget.imageUrls.length,
            )),
      ],
    );
  }
}

class ImageCarousellIndicator extends StatelessWidget {
  final Function(int) onTap;
  final int activePage;
  final int length;
  const ImageCarousellIndicator(
      {super.key,
      required this.onTap,
      required this.activePage,
      required this.length});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(length, (index) => index)
            .asMap()
            .map(
              (index, item) => MapEntry(
                index,
                GestureDetector(
                  onTap: () => onTap(index),
                  child: Container(
                    width: 12,
                    height: 12,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == activePage ? Colors.pink : Colors.grey,
                    ),
                  ),
                ),
              ),
            )
            .values
            .toList()
            .addGap(gapSize: 8, axis: Axis.horizontal));
  }
}
