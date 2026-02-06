import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class ProfileService {
  static const _url = 'https://dummyjson.com/auth/me';

  Future<User> fetchProfile(String accessToken) async {
    final response = await http.get(
      Uri.parse(_url),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
        'Failed to fetch profile: ${response.statusCode}',
      );
    }
  }
}