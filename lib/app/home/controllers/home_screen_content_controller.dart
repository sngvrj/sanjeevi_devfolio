import 'package:flutter/material.dart';

class MainScreenContentController extends ChangeNotifier {
  bool expanded = true;
  void updateMenuButton() {
    expanded = !expanded;
    notifyListeners();
  }
}
