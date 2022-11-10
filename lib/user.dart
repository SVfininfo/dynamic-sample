import 'package:flutter/foundation.dart';

class User extends ChangeNotifier{
  String email = "";
  String password = "";
  void signIn (String emailValue, String passwordValue){
    email = emailValue;
    password = passwordValue;
    notifyListeners();
  }
}