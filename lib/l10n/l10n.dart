import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale("en"),
    const Locale("fr"),
    const Locale("es"),
    const Locale("it"),
    const Locale("de")
  ];
}

enum SupportedLocale { en, fr, es, de, it }

extension SupportedLocalExtension on SupportedLocale {
  String get code => toString().split('.').last;
  String get name {
    String name;
    switch (this) {
      case SupportedLocale.en:
        name = 'English';
        break;
      case SupportedLocale.fr:
        name = 'French';
        break;
      case SupportedLocale.es:
        name = 'Spanish';
        break;
      case SupportedLocale.de:
        name = 'German';
        break;
      case SupportedLocale.it:
        name = 'Italian';
        break;
    }
    return name;
  }

  LanguageNames get languages {
    LanguageNames languages;
    switch (this) {
      case SupportedLocale.en:
        languages = LanguageNames(
            english: "English",
            french: "French",
            german: "German",
            italian: "Italian",
            spanish: "Spanish");
        break;
      case SupportedLocale.fr:
        languages = LanguageNames(
            english: "Anglais",
            french: "Français",
            german: "Allemand",
            italian: "Italien",
            spanish: "Espagnol");
        break;
      case SupportedLocale.es:
        languages = LanguageNames(
            english: "Inglés",
            french: "Francés",
            german: "Alemán",
            italian: "Italiano",
            spanish: "Español");
        break;
      case SupportedLocale.it:
        languages = LanguageNames(
            english: "Inglese",
            french: "Francese",
            german: "Tedesco",
            italian: "Italiano",
            spanish: "Spagnolo");
        break;
      case SupportedLocale.de:
        languages = LanguageNames(
            english: "Englisch",
            french: "Französisch",
            german: "Deutsch",
            italian: "Italienisch",
            spanish: "Spanisch");
        break;
    }
    return languages;
  }
}

class LanguageNames {
  final String english;
  final String spanish;
  final String german;
  final String italian;
  final String french;

  LanguageNames(
      {required this.english,
      required this.french,
      required this.german,
      required this.italian,
      required this.spanish});
}
