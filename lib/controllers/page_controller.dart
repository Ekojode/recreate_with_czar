import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageNotifier extends ChangeNotifier {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  void switchPage(int newIndex) {
    _pageIndex = newIndex;
    notifyListeners();
  }
}

final pageProvider = ChangeNotifierProvider<PageNotifier>((ref) {
  return PageNotifier();
});
