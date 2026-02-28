import 'package:flutter/material.dart';
import 'package:textify_demo/theme/dark.dart';
import 'package:textify_demo/theme/light_mode.dart';

class Themeprovider extends ChangeNotifier{
  ThemeData _themeData = lightMode;
  ThemeData get themeData => _themeData;
  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }
  void toggleTheme(){
    if(_themeData== lightMode){
      themeData= darkMode;
    }
    else {
      themeData = lightMode;
    }
  }
}