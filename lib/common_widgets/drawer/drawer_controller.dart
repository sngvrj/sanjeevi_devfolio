import 'package:flutter/material.dart';

class CustomDrawerController extends ChangeNotifier {
  Duration get initialDelayTime => _initialDelayTime;
  Duration get itemSlideTime => _itemSlideTime;
  Duration get staggerTime => _staggerTime;
  Duration get buttonDelayTime => _buttonDelayTime;
  Duration get buttonTime => _buttonTime;
  final List<String> _menuTitles = ['Home', 'About', 'Portfolio', 'Contact'];
  List<String> get menuTitle => _menuTitles;

  final Duration _initialDelayTime = Duration(milliseconds: 50);
  final Duration _itemSlideTime = Duration(milliseconds: 250);
  final Duration _staggerTime = Duration(milliseconds: 50);
  final Duration _buttonDelayTime = Duration(milliseconds: 150);
  final Duration _buttonTime = Duration(milliseconds: 500);
  Duration _animationDuration() {
    return _initialDelayTime +
        (_staggerTime * _menuTitles.length) +
        _buttonDelayTime +
        _buttonTime;
  }

  Duration get animationDuration => _animationDuration();
}
