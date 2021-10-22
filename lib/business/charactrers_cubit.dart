import 'package:bloc/bloc.dart';
import 'package:flutter_breaking/data/models/characteer.dart';
import 'package:flutter_breaking/data/repository/characters_web_services.dart';
import 'package:meta/meta.dart';

part 'charactrers_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
   List<Character> characters=[];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Character> listAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }
}
