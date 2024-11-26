part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

final class CharactersInitial extends CharactersState {}

final class CharactersLoading extends CharactersState {}

final class CharactersFailuer extends CharactersState {
  final String errorMassage;

  CharactersFailuer(this.errorMassage);
}

final class CharactersSuccess extends CharactersState {
  final List<Character> character;

  CharactersSuccess(this.character);
}
