import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const String _tokenKey = "auth_token";

  // ✅ Save token
  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  // (Optional) Read token later
  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  // (Optional) Delete token (logout)
  Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }

}
