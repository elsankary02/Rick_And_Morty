import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/business_logic/cubit/character_cubit.dart';
import 'package:rick_and_morty/constant/colors.dart';
import 'package:rick_and_morty/data/web_services/character_api.dart';
import 'package:rick_and_morty/presentation/screens/character_screen.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    splashRickAndMotry();
    super.initState();
  }

  splashRickAndMotry() {
    Future.delayed(const Duration(seconds: 2), () {
      // ignore: use_build_context_synchronously
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => BlocProvider<CharacterCubit>(
            create: (context) => CharacterCubit(
              ApiService(Dio()),
            )..fetchAllCharacter(),
            child: const CharacterScreen(),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/rick-and-morty.jpg',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
