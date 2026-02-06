import 'package:flutter/material.dart';
import '../models/brand_model.dart';
import '../services/brand_service.dart';

class BrandViewModel extends ChangeNotifier {
  final BrandService _service = BrandService();

  List <Brand> _brands = [];
  int _selectedIndex = 0;
  bool _isLoading = false;

  List<Brand> get brands => _brands;
  int get selectedIndex => _selectedIndex;
  bool get isLoading => _isLoading;

  Future<void> loadBrands() async {
    _isLoading = true;
    notifyListeners();

    try {
      _brands = await _service.fetchBrands();
    } catch (e) {
      debugPrint(e.toString());
    }

    _isLoading = false;
    notifyListeners();
  }

  void selectBrand(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
