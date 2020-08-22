import 'package:flutter/cupertino.dart';
import 'package:proyectofinal/home/homescreen.dart';


Map<String, WidgetBuilder> getApplicationRoutes(){
  return <String, WidgetBuilder>{
    '/':(BuildContext context) => HomeScreen(),
    
  
  };

}