import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppLocalStorage {
  static const localeKey = "Locale_Key";

  static const _storage = FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
      iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock));

  static FlutterSecureStorage get storage => _storage;

  static void saveLocale(String locale) async {
    await _storage.write(key: localeKey, value: locale);
  }

  static Future<Locale> getLocale() async {
    final localeCode = await storage.read(key: localeKey);
    return Locale(localeCode ?? "en");
  }
}
