import 'package:flutter/material.dart';
// import 'package:ku_t/Modules/Model/myData.dart';
// import 'package:ku_t/Modules/Model/test.dart';

class ItemProvider extends ChangeNotifier {
  List<Map<String, dynamic>> data = [];

  void addItem(item) {
    data.add(item);
    notifyListeners();
  }

  void editItem(int index, newItem) {
    data[index] = newItem;
    notifyListeners();
  }

  void removeItem(int index) {
    data.removeAt(index);
    notifyListeners();
  }
}
