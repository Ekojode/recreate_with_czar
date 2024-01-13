import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controllers.dart';

class LocaleNotifier extends ChangeNotifier {
  Locale _appLocale = const Locale("en");

  Locale get appLocale => _appLocale;

  void changeLocale(String locale) async {
    AppLocalStorage.saveLocale(locale);
    _appLocale = Locale(locale);
    notifyListeners();
  }

  void initializeLocale() async {
    _appLocale = await AppLocalStorage.getLocale();
    notifyListeners();
  }
}

final localeProvider = ChangeNotifierProvider<LocaleNotifier>((ref) {
  return LocaleNotifier();
});
