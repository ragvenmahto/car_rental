import 'package:car_rental/view/brand_detail_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/brand_model.dart';
import '../../viewmodel/car_viewmodel.dart';
import '../widgets/car_card.dart';


class BrandDetailPage extends StatefulWidget {
  final Brand brand;

  const BrandDetailPage({
    super.key,
    required this.brand,
  });

  @override
  State<BrandDetailPage> createState() => _BrandDetailPageState();
}

class _BrandDetailPageState extends State<BrandDetailPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CarViewModel>().loadCars(widget.brand.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CarViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.brand.name),
      ),
      body: vm.isLoading
          ? const Center(child: CircularProgressIndicator())
          : vm.cars.isEmpty
          ? const Center(child: Text('No cars found'))
          : GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemCount: vm.cars.length,

        // navigate to detail page plus
        itemBuilder: (context, index) {
          final car = vm.cars[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BrandDetailPlus(car: car),
                ),
              );
            },
            child: CarCard(car: car),
          );
        },

      ),
    );
  }
}