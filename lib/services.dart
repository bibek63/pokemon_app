import 'dart:convert';
import 'package:http/http.dart' as http;

class RemoteService {
  var api =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  Future<List?> getPokemonData() async {
    var client = http.Client();
    var uri = Uri.parse(api);
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data['pokemon'];
    }
    return null;
  }
}
