import 'package:firebase_auth/firebase_auth.dart';

import '../utils/error_codess.dart';
import '../utils/reusable_widgets.dart';

class UserService{

  Future loginAdmin({required String email,required  String password})async{
    try{
      final response = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return response.user;
    }on FirebaseAuthException catch(e){
       showToast(ErrorCodes.getFirebaseErrorMessage(e));
       return null;
    }catch(e){
      print(e.toString());
      //throw e.toString();
      return null;
    }

  }
}
