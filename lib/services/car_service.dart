import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import '../models/car_model.dart';

class CarService {

  // 🔹 Brand → API slug
  String _mapBrandToSlug(String brand) {
    switch (brand.toLowerCase()) {
      case 'bmw':
        return 'bmw';
      case 'volvo':
        return 'volvo';
      default:
        return brand.toLowerCase();
    }
  }

  // 🔹 FETCH ALL CARS (NEW)
  Future<List<Car>> fetchAllCars() async {
    const url = 'https://horizontal-scrollbar-4.onrender.com/all';

    debugPrint('🔥 CAR API URL: $url');

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Car.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load all cars');
    }
  }

  // 🔹 FETCH BY BRAND
  Future<List<Car>> fetchCarsByBrand(String brandName) async {
    final slug = _mapBrandToSlug(brandName);
    final url = 'https://horizontal-scrollbar-4.onrender.com/$slug';

    debugPrint('🔥 CAR API URL: $url');

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Car.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load cars');
    }
  }
}
