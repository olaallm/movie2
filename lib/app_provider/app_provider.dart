

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  String appLanguage;

  // Constructor with an optional initial language parameter
  AppProvider({this.appLanguage = 'en'}) {
    initProvider();
  }

  Future<void> initProvider() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      // Safely get the language, with 'en' as a default if not set
      appLanguage = prefs.getString('language') ?? 'en';
    } catch (e) {
      print('Error loading language preference: ${e.toString()}');
    }
  }

  Future<void> changeLanguage(String newLanguage) async {
    if (appLanguage == newLanguage) {
      return; // No change needed
    }

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('language', newLanguage);
      appLanguage = newLanguage;
      notifyListeners(); // Notify listeners after language is updated
    } catch (e) {
      print('Error saving new language: ${e.toString()}');
    }
  }
}
