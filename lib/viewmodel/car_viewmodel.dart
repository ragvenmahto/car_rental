import 'package:flutter/material.dart';
import '../models/car_model.dart';
import '../services/car_service.dart';

class CarViewModel extends ChangeNotifier {
  final CarService _service = CarService();

  // car brands
  List<Car> _cars = [];

  // recommended cars
  List<Car> _recommendedCars = [];

  // booked cars
  final List<Car> _bookedCars = [];

  bool _isLoading = false;

 // getters
  List<Car> get cars => _cars;
  List<Car> get recommendedCars => _recommendedCars;
  List<Car> get bookedCars => _bookedCars;
  bool get isLoading => _isLoading;

  // loading -> car brands
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

  // loading -> recommended cars
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

  // book a car
  void bookCar(Car car) {
    final alreadyBooked = _bookedCars.any((c) => c.id == car.id);
    if (alreadyBooked) return;

    _bookedCars.add(car);
    notifyListeners();
  }

  // remove booked car
  void removeBookedCar(Car car) {
    _bookedCars.removeWhere((c) => c.id == car.id);
    notifyListeners();
  }
}
