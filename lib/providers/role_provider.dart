import 'package:flutter/material.dart';

// class Role extends ChangeNotifierProvider {
//   int role = 0;

//   Role({required super.create});

//   void changeRole(){
//     role = 1;
    
//   }
  
  
// }


class Role extends ChangeNotifier{
  int role = 0;

  void changeRole(){
    role = 1;
    
  }
  
}