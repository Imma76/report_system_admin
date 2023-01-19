import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:report_system_admin/main.dart';
import 'package:report_system_admin/src/services/user_services.dart';
import 'package:report_system_admin/src/views/desktop_view/home_page.dart';

import '../utils/reusable_widgets.dart';


class  UserController extends ChangeNotifier{
  UserService userService=UserService();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loading=false;

  void loginAdmin()async{

    if(emailController.text== null && passwordController.text ==null|| emailController.text==''||passwordController.text==
    ''){
      showToast("complete all fields");
      return;

    }
    loading=true;
    notifyListeners();
    final user = await userService.loginAdmin(email: emailController.text.trim(), password: passwordController.text.trim());
    if(user ==null){
      loading=false;
      notifyListeners();
      return;
    }
    showToast('signed in successfully');
    // if(user!=null){
    //
    // }
    loading=false;
    notifyListeners();
    Navigator.pushNamed(navigatorKey!.currentContext!, DesktopHomePage.route) ;

   // Navigator.pus

  }


}