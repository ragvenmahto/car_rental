import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/profile_service.dart';
import '../services/secure_storage_service.dart';

class ProfileViewModel extends ChangeNotifier {
  final ProfileService _profileService = ProfileService();
  final SecureStorageService _storageService = SecureStorageService();

  User? _user;
  bool _isLoading = false;

  User? get user => _user;
  bool get isLoading => _isLoading;

  Future<void> loadProfile() async {
    _isLoading = true;
    notifyListeners();

    try {
      // reading token from storage
      final token = await _storageService.getToken();

      debugPrint('PROFILE TOKEN => $token');

      if (token == null || token.isEmpty) {
        throw Exception('Token not found');
      }

      _user = await _profileService.fetchProfile(token);
    } catch (e) {
      debugPrint('PROFILE ERROR => $e');
      _user = null;
    }

    _isLoading = false;
    notifyListeners();
  }
}
