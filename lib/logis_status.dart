import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

Future<String> signIn(String email, String password) async {
try{
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
FirebaseUser user = (await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).user;
return user.uid;
}catch (e) {
  print(e.toString());
} 



      
  
}

 void signInWithEmail(BuildContext context, user) async {
    // marked async
      if (user != null) {
        // sign in successful!
         print('sign in YES');
       //Navigator.push(context, CupertinoPageRoute(
        //builder: (context) => HomeScreen()));
      } else {
        // sign in unsuccessful
        print('sign in Not');
        // ex: prompt the user to try again
      }
    }
  