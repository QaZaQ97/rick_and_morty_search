import 'dart:convert';

import 'package:rick_and_morty_search/data/models/character.dart';
import 'package:http/http.dart' as http;

class CharacterRepo {
  final url = 'https://rickandmortyapi.com/api/character';

  Future<Character> getCharacter(int page, String name) async {
    var response = await http.get(Uri.parse(url + '?page=$page&name=$name'));
    try {
      var jsonResult = json.decode(response.body);
      return Character.fromJson(jsonResult);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
