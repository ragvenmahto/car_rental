import 'package:car_rental/viewmodel/car_viewmodel.dart';
import 'package:car_rental/viewmodel/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodel/brand_viewmodel.dart';
import 'viewmodel/bottom_nav.dart';
import 'view/onboarding_screen.dart';

void main() {
  runApp(const AppRoot());
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // 🔹 Onboarding flow
        ChangeNotifierProvider(
          create: (_) => OnboardingViewModel(),
        ),

        // 🔹 Bottom navigation (HomeScreen)
        ChangeNotifierProvider(
          create: (_) => BottomNavViewModel(),
        ),

        // 🔹 Brands (used in HomeTab → BrandListPage)
        ChangeNotifierProvider(
          create: (_) => BrandViewModel(),
        ),

        // 🔹 Profile (used in ProfileTab)
        ChangeNotifierProvider(
          create: (_) => ProfileViewModel(),
        ),

        ChangeNotifierProvider(
          create: (_) => CarViewModel(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(), // 👈 entry point
    );
  }
}
