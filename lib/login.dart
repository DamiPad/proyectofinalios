
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyectofinal/home/homescreen.dart';
import 'package:proyectofinal/registro.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class LoginScreen extends StatefulWidget {
 //LoginScreen({Key key}) : super(key: key);

  @override
   LoginScreenState createState() =>  LoginScreenState();
}

class  LoginScreenState extends State <LoginScreen> {
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
    //final user = Provider.of<UserLogin>(context);
    return CupertinoPageScaffold(
          key: _key,
          child: Form(
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
                                      Text('Strateg IT', style: TextStyle(fontSize:35, fontWeight: FontWeight.bold, color:CupertinoColors.white)),
                                      Padding(padding: EdgeInsets.all(20.0)),
                                       Container(
                                         width: 300,
                                         height: 50,
                                         child: CupertinoTextField(
                                            controller: usuarioController,
                                             placeholder: "Ingrese email",
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
                                      
                                      
                                      Padding(padding: EdgeInsets.all(8.0)),
                                     Container(
                                       width: 300,
                                       height: 50,
                                       child: CupertinoTextField(
                                            placeholder: "Ingrese su password",
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
                                    // user.status == Status.Authenticating ? Center(child: CircularProgressIndicator()):
                                     
                                      
                                      Padding(padding: EdgeInsets.all(16.0)),
                                      Container(
                                        width: 200,
                                        child: CupertinoButton(
                                          child: Text("Sign In"),
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
                                                signInWithEmail();
                                            }
                                            //signIn(usuarioController.text,passwordController.text);
                                            
                                            //Provider.of<LoginState>(context);
                                           /* if(formKey.currentState.validate()){
                                              if(!await user.signIn(
                                                usuarioController.text, passwordController.text))
                                                _key.currentState.showSnackBar(SnackBar(content: Text("Error"),));
                                              
                                            }
                                            Navigator.push(context, CupertinoPageRoute(
                                            builder: (context) => HomeScreen()));
                                            FirebaseAuth.instance.signInWithEmailAndPassword(
                                              email: usuarioController.text,
                                              password: passwordController.text,
                                            ).then((CurrentUser user){
                                               Navigator.push(context, CupertinoPageRoute(
                                              builder: (context) => HomeScreen()));
                                        
                                            }).catchError((e){
                                              print(e);

                                            });*/
                                          },
                                          
                                        ),
                                      ),
                                      Padding(padding: EdgeInsets.all(8.0)),
                                      CupertinoButton(
                                          child: Text("Registrarse..."),
                                          onPressed:(){
                                            //Text('hola');
                                            Navigator.push(context, CupertinoPageRoute(
                                            builder: (context) => RegistroScreen()));
                                        
                                        },
                                    
                                      ),
                                      Padding(padding: EdgeInsets.all(13.0)),
                                      Text('O conectarse con', style: TextStyle(fontSize:14, fontStyle: FontStyle.italic, color:Color.fromRGBO(255, 127, 80,0.9))),
                                      
                                      
                                      
                                    ],
                                  ),
                      )
      ),
          ),
    );
  }

  void signInWithEmail() async {
    // marked async
    FirebaseUser user;
    try {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    user = (await _firebaseAuth.signInWithEmailAndPassword(email: usuarioController.text, password: passwordController.text)).user;
   } catch (e) {
      print(e.toString());
    } finally {
      if (user != null) {
        // sign in successful!
       Navigator.push(context, CupertinoPageRoute(
        builder: (context) => HomeScreen()));
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