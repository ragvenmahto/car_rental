import 'package:flutter/material.dart';
import '../models/car_model.dart';
import '../services/car_service.dart';

class CarViewModel extends ChangeNotifier {
  final CarService _service = CarService();

  // 🔹 BRAND CARS
  List<Car> _cars = [];

  // 🔹 RECOMMENDED CARS
  List<Car> _recommendedCars = [];

  // 🔹 BOOKED CARS
  final List<Car> _bookedCars = [];

  bool _isLoading = false;

  // 🔹 GETTERS
  List<Car> get cars => _cars;
  List<Car> get recommendedCars => _recommendedCars;
  List<Car> get bookedCars => _bookedCars;
  bool get isLoading => _isLoading;

  // 🔹 BRAND LOAD
  Future<void> loadCars(String brandName) async {
    _isLoading = true;
    notifyListeners();

    try {
      _cars = await _service.fetchCarsByBrand(brandName);
    } catch (_) {
      _cars = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  // 🔹 RECOMMENDED LOAD (ONCE)
  Future<void> loadRecommendedCars() async {
    if ( _recommendedCars.isNotEmpty) return;

    _isLoading = true;
    notifyListeners();

    try {
      _recommendedCars = await _service.fetchAllCars();
    } catch (_) {
      _recommendedCars = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  // 🔹 BOOK A CAR
  void bookCar(Car car) {
    final alreadyBooked = _bookedCars.any((c) => c.id == car.id);
    if (alreadyBooked) return;

    _bookedCars.add(car);
    notifyListeners();
  }

  // 🔴 REMOVE BOOKED CAR (NEW)
  void removeBookedCar(Car car) {
    _bookedCars.removeWhere((c) => c.id == car.id);
    notifyListeners();
  }
}
