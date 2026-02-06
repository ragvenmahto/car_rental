import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  Future<String> login({
    required String username,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse("https://dummyjson.com/auth/login"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "username": username,
        "password": password,
        "expiresInMins": 30, // optional but good
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // ✅ FIX HERE
      return data["accessToken"];
    } else {
      throw Exception("Login failed");
    }
  }
}
