import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistroScreen extends StatefulWidget {
  //RegistroScreen({Key key}) : super(key: key);

  @override
  _RegistroScreenState createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  TextEditingController usuarioController;
  TextEditingController passwordController;

  final formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  @override
  void initState(){
    super.initState();
    usuarioController=TextEditingController(text: "");
    passwordController = TextEditingController(text: "");

  }
  @override
  Widget build(BuildContext context) {
     return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Color.fromRGBO(217, 136, 128, 0.5),
        middle: Text("Registrarse", style: TextStyle(fontSize:25, color:CupertinoColors.white)),),
          key: _key,
          child: Form(
            child: Container(
            key: formKey,
            child: Container(
              width: double.infinity,
              height: double.infinity,
                      decoration:  BoxDecoration(
                        gradient:  LinearGradient(
                        colors: <Color>[
                          const Color.fromRGBO(217, 136, 128, 0.8),
                          const Color.fromRGBO(255, 255, 255, 0.9),
                        ],
                        stops: [0.2, 1.0],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(0.0, 1.0),
                      )),
                      child: Container(
                        
                        child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                     Text('Email', style: TextStyle(color:CupertinoColors.white)),
                                       Container(
                                         width: 300,
                                         height: 50,
                                         child: CupertinoTextField(
                                            controller: usuarioController,
                                             
                                             style: TextStyle(color:CupertinoColors.inactiveGray),
                                             suffixMode: OverlayVisibilityMode.editing,
                                              prefix: Padding(
                                                padding: const EdgeInsets.only(right: 2, left: 8),
                                                child: Icon(
                                                  CupertinoIcons.person_add,
                                                  size: 30,
                                                  color: CupertinoColors.systemPink,
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                
                                                borderRadius: BorderRadius.circular(10),
                                                color: CupertinoColors.white.withOpacity(0.8),
                                                
                                              
                                               
                                              ),
                                              
                                          ),
                                       ),
                                      
                                      
                                      Padding(padding: EdgeInsets.all(10.0)),
                                      Text('Password', style: TextStyle(color:CupertinoColors.white)),
                                      Container(
                                       width: 300,
                                       height: 50,
                                       child: CupertinoTextField(
                                            controller: passwordController,
                                             obscureText: true,
                                             style: TextStyle(color:CupertinoColors.inactiveGray),
                                             suffixMode: OverlayVisibilityMode.editing,
                                              prefix: Padding(
                                                padding: const EdgeInsets.only(right: 2, left: 8),
                                                child: Icon(
                                                  CupertinoIcons.eye,
                                                  size: 30,
                                                  color: CupertinoColors.systemPink,
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: CupertinoColors.white.withOpacity(0.8),
                                              ),
                                            
                                              
                                          ),
                                     ),

                                     Padding(padding: EdgeInsets.all(10.0)),
                                      Text('Verificar Password', style: TextStyle(color:CupertinoColors.white)),
                                      Container(
                                       width: 300,
                                       height: 50,
                                       child: CupertinoTextField(
                                            //controller: passwordController,
                                             obscureText: true,
                                             style: TextStyle(color:CupertinoColors.inactiveGray),
                                             suffixMode: OverlayVisibilityMode.editing,
                                              prefix: Padding(
                                                padding: const EdgeInsets.only(right: 2, left: 8),
                                                child: Icon(
                                                  CupertinoIcons.eye,
                                                  size: 30,
                                                  color: CupertinoColors.systemPink,
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: CupertinoColors.white.withOpacity(0.8),
                                              ),
                                            
                                              
                                          ),
                                     ),
                                     
                                      
                                      Padding(padding: EdgeInsets.all(16.0)),
                                      Container(
                                        width: 200,
                                        child: CupertinoButton(
                                          child: Text("Submit"),
                                          padding: EdgeInsets.all(15.0),
                                          color: Color.fromRGBO(255, 127, 80,0.9),
                                          disabledColor: CupertinoColors.activeOrange,
                                          borderRadius: BorderRadius.circular(10.0),
                                          //padding: EdgeInsets.symmetric(horizontal: 100.0, vertical:10.0),
                   
                                          onPressed:()async{
                                            if (usuarioController.text.isEmpty || passwordController.text.isEmpty) {
                                                showCupertinoDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return CupertinoAlertDialog(
                                                        title: Text('error'),
                                                        content: Text('Usuario o contraseña vacio'),
                                                        actions: <Widget>[
                                                          FlatButton(
                                                              onPressed: () {
                                                                Navigator.of(context).pop();
                                                              },
                                                              child: Text('ok'))
                                                        ],
                                                      );
                                                    });
                                              } else {
                                                // Validation passed
                                                createUser();
                                            }
                                            //signIn(usuarioController.text,passwordController.text);
                                          },
                                          
                                        ),
                                      ),
                                      
                                    ],
                                  ),
                      )
      ),
    ),
    ),
    );
  }

   void createUser() async {
    // marked async
    FirebaseUser user;
    try {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    user = (await _firebaseAuth.createUserWithEmailAndPassword(email: usuarioController.text, password: passwordController.text)).user;
   } catch (e) {
      print(e.toString());
    } finally {
      if (user != null) {
        // sign in successful!
       print('sign in YES');
      } else {
        // sign in unsuccessful
        print('sign in Not');
        // ex: prompt the user to try again
      }
    }
  }

  @override
  void dispose(){
    usuarioController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}