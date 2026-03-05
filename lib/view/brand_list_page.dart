import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/brand_viewmodel.dart';
import '../widgets/brand_item.dart';
import 'brand_detail_page.dart';

class BrandListPage extends StatefulWidget {
  const BrandListPage({super.key});

  @override
  State<BrandListPage> createState() => _BrandListPageState();
}

class _BrandListPageState extends State<BrandListPage> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BrandViewModel>().loadBrands();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<BrandViewModel>();

    if (vm.isLoading) {
      return const SizedBox(
        height: 90,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (vm.brands.isEmpty) {
      return const SizedBox(
        height: 90,
        child: Center(child: Text('No brands found')),
      );
    }

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: vm.brands.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final brand = vm.brands[index];
          final isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });

              Navigator.push(context,
                MaterialPageRoute(
                  builder: (_) => BrandDetailPage(
                    brand: brand,
                  ),
                ),
              );
            },
            child: BrandItem(
              brand: brand,
              isSelected: isSelected,
            ),
          );
        },
      ),
    );
  }
}
