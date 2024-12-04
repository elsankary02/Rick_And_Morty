import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rick_and_morty/business_logic/cubit/character_cubit.dart';
import 'package:rick_and_morty/constant/colors.dart';
import 'package:rick_and_morty/presentation/widgets/details_widget.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.yellow,
        title: const Text(
          'Rick & Morty',
          style: TextStyle(
            color: AppColors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: AppColors.grey,
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: BlocBuilder<CharacterCubit, CharacterState>(
          builder: (context, state) {
            if (state is CharactersSuccess) {
              log('ازيك يبيبي انا جيت');
              return GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2 / 3,
                ),
                itemCount: state.characterModel.length,
                itemBuilder: (context, index) => DetailsWidget(
                  results: state.characterModel[index],
                ),
              );
            }
            if (state is CharactersFailuer) {
              return Text(state.errorMassage);
            }
            {
              log('وه جاااار تحميل الداتا');
              return Center(
                child: LoadingAnimationWidget.twistingDots(
                    leftDotColor: AppColors.white,
                    rightDotColor: AppColors.yellow,
                    size: 200),
              );
            }
          },
        ),
      ),
    );
  }
}
