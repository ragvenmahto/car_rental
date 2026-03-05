import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/car_viewmodel.dart';
import '../widgets/recommended_car_card.dart';
import 'brand_detail_plus.dart';

class RecommendedForYou extends StatefulWidget {
  const RecommendedForYou({super.key});

  @override
  State<RecommendedForYou> createState() => _RecommendedForYouState();
}

class _RecommendedForYouState extends State<RecommendedForYou> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CarViewModel>().loadRecommendedCars();
    });
  }

  @override
  Widget build(BuildContext context) {

    final vm = context.watch<CarViewModel>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Recommended for you',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'See all',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        if (vm.isLoading)
          const Padding(
            padding: EdgeInsets.all(24),
            child: Center(child: CircularProgressIndicator()),
          )
        else if (vm.recommendedCars.isEmpty)
          const Padding(
            padding: EdgeInsets.all(24),
            child: Center(child: Text('No cars available')),
          )
        else
          ListView.builder(
            itemCount: vm.recommendedCars.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              final car = vm.recommendedCars[index];

              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BrandDetailPlus(car: car),
                      ),
                    );
                  },
                  child: RecommendedCarCard(car: car),
                ),
              );
            },
          ),
      ],
    );
  }
}
