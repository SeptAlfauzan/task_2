import 'package:flutter/material.dart';

class TextWithButtonAction extends StatelessWidget {
  final String text;
  final String actionName;
  final Function onTap;
  const TextWithButtonAction(
      {super.key,
      required this.text,
      required this.actionName,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(text),
          ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.black),
              foregroundColor: WidgetStatePropertyAll(Colors.white),
            ),
            onPressed: () => onTap(),
            child: Text(actionName),
          )
        ],
      ),
    );
  }
}
