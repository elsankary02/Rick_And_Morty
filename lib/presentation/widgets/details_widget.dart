import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/constant/colors.dart';
import 'package:rick_and_morty/data/models/results_model.dart';

class DetailsWidget extends StatelessWidget {
  final Results results;
  const DetailsWidget({super.key, required this.results});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: AppColors.white),
        child: GridTile(
          footer: Container(
            decoration: const BoxDecoration(color: Colors.black54),
            child: Text(
              results.name!,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: results.image!,
            fit: BoxFit.cover,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
