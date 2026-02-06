import 'package:flutter/material.dart';
import '../../models/car_model.dart';

class RecommendedCarCard extends StatelessWidget {
  final Car car;

  const RecommendedCarCard({
    super.key,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // 🔹 LEFT IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              car.image,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 12),

          // 🔹 CENTER DETAILS
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Car Name
                Text(
                  car.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),

                const SizedBox(height: 4),

                // Location
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 14,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      car.location,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                // Rating
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 14,
                      color: Colors.orange,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      car.rating.toString(),
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Price / day
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '₹${car.pricePerDay}/day',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
