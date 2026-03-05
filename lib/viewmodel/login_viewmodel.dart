import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/secure_storage_service.dart';

class LoginViewModel extends ChangeNotifier {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final AuthService _authService = AuthService();
  final SecureStorageService _storageService = SecureStorageService();

  bool isPasswordVisible = false;
  bool isLoading = false;
  String? errorMessage;
  bool loginSuccess = false;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  Future<void> login() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    debugPrint("USERNAME: ${usernameController.text}");
    debugPrint("PASSWORD: ${passwordController.text}");

    try {
      // get token from API
      final token = await _authService.login(
        username: usernameController.text.trim(),
        password: passwordController.text.trim(),
      );

      // save token securely
      await _storageService.saveToken(token);

      debugPrint("TOKEN SAVED SECURELY");
      loginSuccess = true;
    }
    catch (e) {
      errorMessage = "Invalid username or password";
    }

    isLoading = false;
    notifyListeners();
  }

  void resetLoginState() {
    loginSuccess = false;
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
