/*
 * language_settings.dart
 * orino_smart_village
 * Created by Alessandro Riva
 * Copyright (c) 2022.
 */

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageSettings with ChangeNotifier {
  String _lang = 'it';
  SharedPreferences? _preferences;

  String get lang => _lang;

  LanguageSettings() {
    _loadSettingsFromPrefs();
  }

  _initializePrefs() async {
    // '??=' is equal to '== null'
    _preferences ??= await SharedPreferences.getInstance();
  }

  _loadSettingsFromPrefs() async {
    await _initializePrefs();
    _lang = _preferences?.getString('language') ?? 'it';
    notifyListeners();
  }

  _saveSettingsToPrefs() async {
    await _initializePrefs();
    _preferences?.setString('language', _lang);
  }

  void setLanguage(String langCode) {
    _lang = langCode;
    _saveSettingsToPrefs();
    notifyListeners();
  }
}
