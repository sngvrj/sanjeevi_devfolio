import 'package:flutter/material.dart';

class MainScreenController extends ChangeNotifier {
  late BuildContext _context;
  bool expanded = true;
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void init({required BuildContext context, required int index}) async {
    _context = context;
    print('callBack index is' + index.toString());
    _selectedIndex = index;
    notifyListeners();
    expanded = true;
    // updateMenuButton();
    notifyListeners();
  }

  void updateMenuButton() {
    expanded = !expanded;
    notifyListeners();
  }
}
