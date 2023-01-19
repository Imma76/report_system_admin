import 'package:firebase_auth/firebase_auth.dart';

import '../utils/error_codess.dart';

class UserService{

  Future<User?> loginAdmin({required String email,required  String password})async{
    try{
      final response = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return response.user;
    }on FirebaseAuthException catch(e){
       ErrorCodes.getFirebaseErrorMessage(e);
    }catch(e){
      print(e.toString());
      throw e.toString();
    }

  }
}
