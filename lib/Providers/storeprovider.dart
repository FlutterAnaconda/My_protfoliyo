import 'package:flutter/material.dart';

import '../models/productmodel.dart';

class StoreProvider with ChangeNotifier {
  ProductModel? _selectedStore;

  ProductModel? get selectedStore => _selectedStore;

  void selectStore(ProductModel store) {
    _selectedStore = store;
    notifyListeners();
  }
}
