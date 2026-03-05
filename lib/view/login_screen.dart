import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../viewmodel/bottom_nav.dart';
import '../viewmodel/login_viewmodel.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
      builder: (context, vm, child) {

        if (vm.loginSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            vm.resetLoginState();

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (_) => ChangeNotifierProvider(
                  create: (_) => BottomNavViewModel(),
                  child: const HomeScreen(),
                ),
              ),
                  (route) => false,
            );
          });
        }

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Text("Let’s Sign you in.",
                    style: GoogleFonts.roboto(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text("Welcome back,\nYou’ve been missed!",
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black26,
                    ),
                  ),


                  const SizedBox(height: 40),

                  TextField(
                    controller: vm.usernameController,
                    decoration: const InputDecoration(
                      labelText: "Username",
                    ),
                  ),

                  const SizedBox(height: 20),

                  TextField(
                    controller: vm.passwordController,
                    obscureText: !vm.isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: "Password",
                      suffixIcon: IconButton(
                        icon: Icon(
                          vm.isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: vm.togglePasswordVisibility,
                      ),
                    ),
                  ),

                  if (vm.errorMessage != null) ...[
                    const SizedBox(height: 12),
                    Text(
                      vm.errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],

                  const Spacer(),

                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: vm.isLoading ? null : vm.login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      child: vm.isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text("Login", style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white,
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
      },
    );
  }
}