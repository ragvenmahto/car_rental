import 'package:flutter/material.dart';
import '../models/brand_model.dart';

class BrandItem extends StatelessWidget {
  final Brand brand;
  final bool isSelected;

  const BrandItem({
    super.key,
    required this.brand,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 45),
      child: Row(
        children: [
          Container(
            width: isSelected ? 40 : 40,
            height: isSelected ? 40 : 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? Colors.black : Colors.grey.shade200,
            ),
            child: ClipOval(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.network(
                  brand.logo,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Icon(
                    Icons.directions_car,
                    color:
                    isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            brand.name,
            style: TextStyle(
              fontSize: 14,
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight:
              isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
