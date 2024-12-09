import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rick_and_morty/business_logic/cubit/character_cubit.dart';
import 'package:rick_and_morty/constant/colors.dart';
import 'package:rick_and_morty/presentation/widgets/details_character_widget.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // excludeHeaderSemantics: false,
        // centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.yellow,
        title: const Text(
          'Rick and Morty',
          style: TextStyle(
            color: AppColors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: AppColors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CharacterCubit, CharacterState>(
            builder: (context, state) {
              if (state is CharactersSuccess) {
                return Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 2 / 3,
                      ),
                      itemCount: state.characterModel.length,
                      itemBuilder: (context, index) => DetailsCharacterWidget(
                        results: state.characterModel[index],
                      ),
                    ),
                  ),
                );
              }
              if (state is CharactersFailuer) {
                return Text(state.errorMassage);
              }
              {
                return Center(
                  child: LoadingAnimationWidget.twistingDots(
                      leftDotColor: AppColors.white,
                      rightDotColor: AppColors.yellow,
                      size: 200),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

OutlineInputBorder outLineinputBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.yellow),
    borderRadius: BorderRadius.circular(8),
  );
}
