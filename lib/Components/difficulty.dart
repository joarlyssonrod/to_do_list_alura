import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  const Difficulty({Key? key, required this.classification}) : super(key: key);

  final int classification;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: classification >= 1 ? Colors.blue : Colors.blue.shade100,
          size: 16,
        ),
        Icon(
          Icons.star,
          color: classification >= 2 ? Colors.blue : Colors.blue.shade100,
          size: 16,
        ),
        Icon(
          Icons.star,
          color: classification >= 3 ? Colors.blue : Colors.blue.shade100,
          size: 16,
        ),
        Icon(
          Icons.star,
          color: classification >= 4 ? Colors.blue : Colors.blue.shade100,
          size: 16,
        ),
        Icon(
          Icons.star,
          color: classification >= 5 ? Colors.blue : Colors.blue.shade100,
          size: 16,
        ),
      ],
    );
  }
}