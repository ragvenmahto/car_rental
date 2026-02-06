import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../viewmodel/login_and_reg_viewmodel.dart';
import '../viewmodel/login_viewmodel.dart';
import 'login_screen.dart';

class LoginAndRegScreen extends StatelessWidget {
  const LoginAndRegScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<LoginAndRegViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 40),

              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  "images/second.jpg",
                  height: 260,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 90),

              Text(
                "Welcome to Car Rental",
                style: GoogleFonts.roboto(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const Spacer(),


              // ✅ FIXED LOGIN BUTTON
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    vm.onLogin();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChangeNotifierProvider(
                          create: (_) => LoginViewModel(),
                          child: const LoginScreen(),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text("Login",
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () => vm.onRegister(),
                  child: Text(
                    "Register",
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
