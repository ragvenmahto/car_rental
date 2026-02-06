import 'package:flutter/material.dart';

class LoginAndRegViewModel extends ChangeNotifier {
  void onLogin() {
    // View decides navigation
  }

  void onRegister() {
    debugPrint("Register clicked");
  }
}