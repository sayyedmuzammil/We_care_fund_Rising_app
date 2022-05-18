import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


var db_control=Get.put(AuthMethods());
class AuthMethods{
  final FirebaseAuth auth=FirebaseAuth.instance;
  final FirebaseFirestore firestrore=FirebaseFirestore.instance;
// late UserCredential cred;

Future<String>signUpUser({
  required String email, 
  required String password,
}) async{
  print(email + password);
  String res='Some error occured';
  try{
    if(email.isNotEmpty || password.isNotEmpty   ){
  UserCredential cred= await auth.createUserWithEmailAndPassword(email: email, password: password);
   print(cred.user!.uid);
  //  await _firestrore.collection('users').doc(cred.user!.uid).set({
  //    'email' : email, 
  //    'password': password, 
  //    'uid' : cred.user!.uid,

  //  });
   res="success";
    }
  }catch(err){
    res=err.toString();
  }
  return res;
}

  Future<String>signInUser({required String email, required String password}) async{
    // return email
  
    String result = 'Something went wrong.';
    print("777 in login $email $password");
    try {
      if (email=='admin@gmail.com' || password=='admin@123') {
        await auth.signInWithEmailAndPassword(
            email: email, password: password);
        result = 'admin';
      }
     else if (email.isNotEmpty || password.isNotEmpty) {
        await auth.signInWithEmailAndPassword(
            email: email, password: password);
        result = 'success';
      } else {
        result = 'please enter all the fields';
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'wrong-password') {
        result = 'Wrong password';
      } else if (err.code == 'user-not-found') {
        result = 'Wrong Email';
      }
    } catch (err) {
      result = err.toString();
    }
    return result;
  
  }

   Future<void> signOut() async{

    await auth.signOut();
  }



}