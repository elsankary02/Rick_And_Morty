import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rick_and_morty/constant/colors.dart';
import 'package:rick_and_morty/data/models/results_model.dart';
import 'package:rick_and_morty/presentation/screens/detail_screen.dart';

class DetailsWidget extends StatelessWidget {
  final Results results;
  const DetailsWidget({super.key, required this.results});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DetailScreen(
            results: results,
          ),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: const BoxDecoration(color: AppColors.white),
          child: GridTile(
            footer: Container(
              decoration: const BoxDecoration(color: Colors.black54),
              child: Text(
                results.name!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
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
              placeholder: (context, url) => Center(
                child: LoadingAnimationWidget.twistingDots(
                    leftDotColor: AppColors.grey,
                    rightDotColor: AppColors.yellow,
                    size: 50),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }
}
