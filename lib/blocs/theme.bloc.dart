import 'package:eshop/themes/dark-yellow.theme.dart';
import 'package:eshop/themes/dark.theme.dart';
import 'package:eshop/themes/light.theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../settings.dart';

class ThemeBloc extends ChangeNotifier {
  var theme = lightTheme();

  change(String color) {
    switch (color) {
      case 'light':
        {
          theme = lightTheme();
          Settings.theme = "light";
          notifyListeners();
          break;
        }

      case 'dark':
        {
          theme = darkTheme();
          Settings.theme = "dark";
          notifyListeners();
          break;
        }

      case 'dark-yellow':
        {
          theme = darkYellowTheme();
          Settings.theme = "dark-yellow";
          notifyListeners();
          break;
        }

      default:
        {
          theme = lightTheme();
          Settings.theme = "light";
          notifyListeners();
          break;
        }
    }
  }
}
