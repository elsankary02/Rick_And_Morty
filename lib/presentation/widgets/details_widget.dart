import 'package:flutter/material.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    super.key,
    // required this.results,
  });
  // final Results results;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.amber,
      ),
      child: GridTile(
        footer: const Text('dsgg'),
        header: const Text('dfhj'),
        child: Image.asset(
          'assets/images/IMG-20241019-WA0040.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
