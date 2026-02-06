import 'package:flutter/material.dart';
import 'package:car_rental/view/brand_list_page.dart';
import '../recommended_for_you.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false, // 👈 we manually handle status bar in app bar
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _HomeAppBar(),
            SizedBox(height: 8),
            BrandListPage(),
            SizedBox(height: 16),
            RecommendedForYou(),
            SizedBox(height: 24), // bottom breathing space
          ],
        ),
      ),
    );
  }
}

class _HomeAppBar extends StatelessWidget {
  const _HomeAppBar();

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        16,
        statusBarHeight + 8, // 👈 below notification bar
        16,
        0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Car Rental',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          CircleAvatar(
            radius: 18,
            child: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
