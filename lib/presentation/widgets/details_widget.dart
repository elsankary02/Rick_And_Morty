import 'package:flutter/material.dart';
import 'package:rick_and_morty/constant/colors.dart';
import 'package:rick_and_morty/data/models/results_model.dart';

class DetailsWidget extends StatelessWidget {
  final Results results;
  final String title;
  final String value;
  final double endIndent;
  const DetailsWidget(
      {super.key,
      required this.title,
      required this.value,
      required this.endIndent,
      required this.results});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '$title : ',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.white,
              ),
            ),
          ],
        ),
        Divider(
          endIndent: endIndent,
          thickness: 2,
          color: AppColors.yellow,
        )
      ],
    );
  }
}
