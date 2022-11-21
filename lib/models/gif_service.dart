import 'dart:convert';

import 'package:http/http.dart';

class GifService {
  Future<List<String>> searchGifs(String query) async {
    Uri searchEndpoint = Uri.https('api.giphy.com', '/v1/gifs/search', {
      'api_key': 'vM8FlDnQe0jDsA3cBDj1Gm9NWCCt6l1e',
      'q': query,
      'limit': '50',
      'lang': 'en'
    });

    Response response = await get(searchEndpoint);

    Map<String, dynamic> responseData = jsonDecode(response.body);

    List<dynamic> results = List.of(responseData['data']);

    print(results);

    List<dynamic> imageObjects =
        results.map((e) => Map.of(e)['images']).toList();

    List<String> urls = imageObjects
        .map((e) => Map.of(e).values.first['url'] as String)
        .toList();

    return urls;
  }
}
