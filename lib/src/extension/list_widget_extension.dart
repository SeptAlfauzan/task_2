import 'package:flutter/material.dart';

extension ListWidget on List<Widget> {
  List<Widget> addGap({required double gapSize, required Axis axis}) {
    return asMap()
        .map(
          (index, item) => MapEntry(
            index,
            Padding(
              padding: EdgeInsets.only(
                  bottom: index < length && axis == Axis.vertical ? gapSize : 0,
                  right:
                      index < length && axis == Axis.horizontal ? gapSize : 0),
              child: item,
            ),
          ),
        )
        .values
        .toList();
  }
}
