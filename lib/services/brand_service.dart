import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/brand_model.dart';

class BrandService {
  static const String _url =
      'https://horizontal-scrollbar-4.onrender.com/brands';

  Future<List<Brand>> fetchBrands() async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Brand.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load brands');
    }
  }
}
