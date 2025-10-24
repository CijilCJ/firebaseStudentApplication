import 'package:flutter/material.dart';
import 'package:new_sample_project/auth/Auth.dart';

class Authprovider extends ChangeNotifier {

  final Auth _authService = Auth();
  String? errorMessagge;
  bool isLoading=false;

  Future <void> signUpProviderFunction(String email, dynamic password )async{

    isLoading=true;
    notifyListeners();

    try {
      await _authService.SignUpFunction(email, password);
    } catch (e) {
      errorMessagge="Error:$e";
    }finally{
      isLoading=false;
      notifyListeners();
    }
  }

  Future<void> signInProviderFunction(String email,dynamic password)async{

    isLoading=true;
    notifyListeners();
    
    try {
      await _authService.SigninFunction(email, password);
    } catch (e) {
      errorMessagge="Error:$e";
    }finally{
      isLoading=false;
      notifyListeners();
    }
  }

  Future<void> logOut()async{
    isLoading=true;
    await _authService.SignOut();
    notifyListeners();
  }
}