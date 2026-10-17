
import 'dart:convert';
import 'package:http/http.dart' as http;

class FilmApiService {
  static Future<List<String>> fetchFilmStocks() async {
    final uri = Uri.parse(
      'https://dummyjson.com/products/category/groceries?limit=5',
    );

    final response = await http.get(uri).timeout(
      const Duration(seconds: 15),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final products = data['products'] as List<dynamic>;

      return products
          .map((product) => product['title'].toString())
          .toList();
    }

    throw Exception('Failed to load data: ${response.statusCode}');
  }
}
