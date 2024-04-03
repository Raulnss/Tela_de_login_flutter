import 'package:flutter/material.dart';

class appcontroler extends ChangeNotifier {
  static appcontroler instance = appcontroler();
  bool isdarktheme = true;
  ChangeTheme(){
    isdarktheme = !isdarktheme;
    notifyListeners();
  }
}