import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/business/charactrers_cubit.dart';
import 'package:flutter_breaking/constants/stringes.dart';
import 'package:flutter_breaking/data/models/characteer.dart';
import 'package:flutter_breaking/data/repository/characters_web_services.dart';
import 'package:flutter_breaking/data/web_services/characters_web_services.dart';
import 'package:flutter_breaking/presentation/screens/characters_details.dart';
import 'package:flutter_breaking/presentation/screens/characters_screen.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            child: CharactersScreen(),
            create: (BuildContext context) => charactersCubit,
          ),
        );
      case charactersDetailsScreen:
        final character =settings.arguments as Character;
        return MaterialPageRoute(builder: (_) => CharactersDetailsScreen(character: character,));
    }
  }
}
