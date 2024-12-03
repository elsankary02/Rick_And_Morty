part of 'character_cubit.dart';

sealed class CharacterState {}

final class CharacterInitial extends CharacterState {}

final class CharactersLoading extends CharacterState {}

final class CharactersFailuer extends CharacterState {
  final String errorMassage;

  CharactersFailuer(this.errorMassage);
}

final class CharactersSuccess extends CharacterState {
  final List<Results> characterModel;

  CharactersSuccess(this.characterModel);
}
