import 'package:flutter/material.dart';

class Searchprovider extends ChangeNotifier{
  bool vis=false;

  changevisible(bool visible){
    vis= !visible;
    notifyListeners();
  }

}