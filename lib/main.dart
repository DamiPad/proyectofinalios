
import 'package:flutter/cupertino.dart';
import 'package:proyectofinal/login.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget { 
 @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
       
      );
  }
}
