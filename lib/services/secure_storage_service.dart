import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const String _tokenKey = "auth_token";

  // saving token
  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  // for read token later
  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  // for delete token (logout)
  Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }

}