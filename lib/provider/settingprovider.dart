import 'package:flutter/material.dart';
class settingprovider extends ChangeNotifier{
ThemeMode mode=ThemeMode.light;
String language='en';
int Index=0;
bool visble=false;
changetheme(ThemeMode Theme){
  mode=Theme;
  notifyListeners();
}
changelanguage(String lang){
  language=lang;
  notifyListeners();
}
changecurrentIndex(int index){
  Index=index;
  notifyListeners();
}
changevis(){
  visble=!visble;
  notifyListeners();
}
}