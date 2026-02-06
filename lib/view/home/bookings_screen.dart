import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/car_viewmodel.dart';

class BookingsTab extends StatelessWidget {
  const BookingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CarViewModel>();
    final bookings = vm.bookedCars;

    if (bookings.isEmpty) {
      return const Center(
        child: Text(
          'No bookings yet',
          style: TextStyle(fontSize: 18),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        final car = bookings[index];

        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                car.image,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(car.name),
            subtitle: Text('₹${car.pricePerDay} / day • ${car.location}'),

            // 🔴 DELETE WITH CONFIRMATION
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Cancel Booking"),
                    content: const Text(
                      "Are you sure you want to remove this booking?",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("No"),
                      ),
                      TextButton(
                        onPressed: () {
                          vm.removeBookedCar(car);
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Yes",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
