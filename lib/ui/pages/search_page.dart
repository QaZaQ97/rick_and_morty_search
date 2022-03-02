import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:rick_and_morty_search/bloc/character_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    context
        .read<CharacterBloc>()
        .add(const CharacterEvent.fetch(page: 1, name: ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CharacterBloc>().state;
    return state.when(
      loading: () {
        return Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(strokeWidth: 6.0),
              SizedBox(width: 20.0),
              Text('Loading...')
            ],
          ),
        );
      },
      loaded: (characterLoaded) => Text('${characterLoaded.info}'),
      error: () => const Text('Nothing found...'),
    );
  }
}
