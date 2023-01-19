import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:report_system_admin/src/services/user_services.dart';


class  UserController extends ChangeNotifier{
  UserService userService=UserService();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loading=false;

  void loginAdmin()async{
    loading=true;
    notifyListeners();
    final user = await userService.loginAdmin(email: emailController.text.trim(), password: passwordController.text.trim());

    // if(user!=null){
    //
    // }
    loading=false;
    notifyListeners();
   // Navigator.pus

  }


}