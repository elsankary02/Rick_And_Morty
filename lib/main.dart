import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/business_logic/cubit/character_cubit.dart';
import 'package:rick_and_morty/data/web_services/character_api.dart';
import 'package:rick_and_morty/presentation/screens/character_screen.dart';

void main() {
  runApp(const RickAndMorty());
}

class RickAndMorty extends StatelessWidget {
  const RickAndMorty({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<CharacterCubit>(
        create: (context) => CharacterCubit(
          ApiService(Dio()),
        )..fetchAllCharacter(),
        child: const CharacterScreen(),
      ),
    );
  }
}
