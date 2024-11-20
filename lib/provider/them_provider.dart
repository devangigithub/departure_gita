  import 'package:flutter/foundation.dart';

  class ThemeModel {
    bool isLight;

    ThemeModel({required this.isLight});
  }

  class ThemeProvider extends ChangeNotifier {
    ThemeModel themeModel = ThemeModel(isLight: false);

    void changeTheme() {
      themeModel.isLight = !themeModel.isLight;
      notifyListeners();
    }
  }
