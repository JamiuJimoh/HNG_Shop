import 'package:flutter/material.dart';

class TextTile extends StatelessWidget {
  const TextTile({super.key, required this.leftText, required this.rightText});
  final String leftText;
  final String rightText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(leftText),
        Text(
          rightText,
          style: Theme.of(context)
              .textTheme
              .displaySmall
              ?.copyWith(fontSize: 14.0),
        ),
      ],
    );
  }
}

