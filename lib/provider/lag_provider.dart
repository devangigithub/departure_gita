import 'package:flutter/material.dart';

class LagProvider with ChangeNotifier {
 String _currentLanguage = 'hi';

 String get currentLanguage => _currentLanguage;

 void toggleLanguage(String newLanguage) {
  if (['en', 'hi', 'gu'].contains(newLanguage)) {
   _currentLanguage = newLanguage;
   notifyListeners(); // Notify listeners when language changes
  }
 }

 String getLanguageText( String hindiText, String gujaratiText,String englishText) {
  switch (_currentLanguage) {
   case 'en':
    return englishText;
   case 'gu':
    return gujaratiText;
   default:
    return hindiText;
  }
 }
}
