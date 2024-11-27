import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/data/models/character.dart';
import 'package:rick_and_morty/data/web_services/character_api.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final ApiService apiService;
  CharactersCubit(this.apiService) : super(CharactersInitial());
  Future<void> setApi() async {
    emit(CharactersLoading());
    try {
      final result = await apiService.getApi(endPoint: 'character');
      List<Character> characters = [];
      final data = result['results'] as List;
      for (var details in data) {
        characters.add(Character.fromJson(details));
      }
      emit(CharactersSuccess(characters));
    } catch (e) {
      if (e is DioException) {
        emit(
          CharactersFailuer(
            e.toString(),
          ),
        );
      }
    }
  }
}
