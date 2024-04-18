import 'package:flutter/material.dart';

class RoleProvider with ChangeNotifier {
  
  bool isEducator = true;

  setRoleAsEducator(){
    isEducator = true; 
    notifyListeners();
  }

  setRoleAsLearner(){
    isEducator = false;
    notifyListeners();
  }
}