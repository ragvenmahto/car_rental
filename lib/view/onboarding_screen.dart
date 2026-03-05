import 'package:car_rental/view/login_and_reg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/login_and_reg_viewmodel.dart';

class OnboardingViewModel extends ChangeNotifier {

}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF1F1F26),
      body: Stack(
        children: [

          Positioned.fill(
            child: Image.asset(
              "images/first.jpg",
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),

          Positioned.fill(
            child: Container(
              color: Colors.black.withAlpha(90),
            ),
          ),

          Positioned(
            left: 24,
            right: 24,
            bottom: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Premium cars.\nEnjoy the luxury",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),

                const SizedBox(height: 14),

                const Text(
                  "Premium and prestige car daily rental.\n"
                      "Experience the thrill at a lower price",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChangeNotifierProvider(
                            create: (_) => LoginAndRegViewModel(),
                            child: const LoginAndRegScreen(),
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "Let's Go",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
