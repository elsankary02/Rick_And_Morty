import 'package:flutter/material.dart';
import 'package:rick_and_morty/constant/colors.dart';
import 'package:rick_and_morty/data/models/results_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.results});
  final Results results;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.yellow,
        title: Text(
          results.name!,
          style: const TextStyle(
            color: AppColors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
