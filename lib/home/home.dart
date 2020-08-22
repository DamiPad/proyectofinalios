import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:ui';
import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:proyectofinal/home/paint_rectangle.dart';



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File pickedImage;
  var text = '';
  var _folio ='';
  var _codigo ='';
  var _partida ='';
  var _monto ='';

  Size _imageSize;
  List<String> _elements = [];
  List<TextElement> _element = [];


  bool imageLoaded = false;

  Future pickImage() async {
    var awaitImage = await ImagePicker.pickImage(source: ImageSource.gallery);
 
    setState(() {
      pickedImage = awaitImage;
      imageLoaded = true;
      if (pickedImage != null) {
      _getImageSize(pickedImage);
      }
      
    });
    FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(pickedImage);
    TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
    VisionText visionText = await textRecognizer.processImage(visionImage);

    for (TextBlock block in visionText.blocks) {

      for (TextLine line in block.lines) {
        for (TextElement word in line.elements) {
          setState(() {
            text = text + word.text + ' ';
            _elements.add(word.toString());
            _element.add(word);
            

          });
        }
        text = text + '\n';
      }
    }
    textRecognizer.close();
    var ab = text.split('\n');
    ab.forEach((element)=>print(element));
    _folio = ab[3];
    _codigo = ab[11];
    _partida = ab[26];
    _monto = ab[31];

  }


   Future<void> _getImageSize(File imageFile) async {
    final Completer<Size> completer = Completer<Size>();

    final Image image = Image.file(imageFile);
    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener((ImageInfo info, bool _) {
        completer.complete(Size(
          info.image.width.toDouble(),
          info.image.height.toDouble(),
        ));
      }),
    );

    final Size imageSize = await completer.future;
    setState(() {
      _imageSize = imageSize;
    });
  }

  @override
  Widget build(BuildContext context) {
      TextEditingController folioController ;
      TextEditingController codigoController;
      TextEditingController partidaController;
      TextEditingController montoController;


    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Color.fromRGBO(217, 136, 128, 0.7),
        middle: Text("Registra tus requisiciones", style: TextStyle(color:CupertinoColors.white)),),
      child: Column(
        children: <Widget>[
          SizedBox(height: 100.0),
          imageLoaded ? Center(
                  child: Container(
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    boxShadow: const [
                      BoxShadow(blurRadius: 20),
                    ],
                  ),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                  height: 250,
                  child: CustomPaint(
                      foregroundPainter:
                          TextDetectorPainter(_imageSize, _element),
                      child: AspectRatio(
                        aspectRatio: _imageSize.aspectRatio,
                        child: Image.file(
                          pickedImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  //child: Image.file(
                    //pickedImage,
                    //fit: BoxFit.cover,
                  //),
                )
          )
              : Container(),
          SizedBox(height: 10.0),
          Center(
            child: FlatButton.icon(
              icon: Icon(
                CupertinoIcons.photo_camera,
                color: Color.fromRGBO(217, 136, 128, 0.7),
                size: 60,
              ),
              label: Text(''),
              textColor: CupertinoTheme.of(context).primaryColor,
              onPressed: () async {
                pickImage();
              },
            ),
          ),
          SizedBox(height: 10.0),
          SizedBox(height: 10.0),
          Row(),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "Sube el  escaneo de tu requisicion",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ),
          text == '' ? Text('Aqui se mostraran los datos de tu requisicion'):  Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                    /*child: Text(
                      text,
                    ),*/
                    child: Column(
                      
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(8.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget>[
                            Text('Folio: ', style: TextStyle(fontSize: 14, color:CupertinoColors.systemPink)),
                            Container(
                            width: 300,
                            height: 30,
                            child:
                            CupertinoTextField(
                              controller: folioController = TextEditingController(text: _folio),
                              
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: CupertinoColors.systemGrey.withOpacity(0.3),
                              ),
                              ),
                            ),
                          ],
                        ),
                        
                      Padding(padding: EdgeInsets.all(8.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget>[
                            Text('Codigo: ', style: TextStyle(fontSize: 14, color:CupertinoColors.systemPink)),
                            Container(
                            width: 280,
                            height: 30,
                            child:
                            CupertinoTextField(
                              controller: folioController = TextEditingController(text: _codigo),
                              
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: CupertinoColors.systemGrey.withOpacity(0.3),
                              ),
                              ),
                            ),
                          ],
                        ),
                      Padding(padding: EdgeInsets.all(8.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget>[
                            Text('Partida: ', style: TextStyle(fontSize: 14, color:CupertinoColors.systemPink)),
                            Container(
                            width: 280,
                            height: 30,
                            child:
                            CupertinoTextField(
                              controller: folioController = TextEditingController(text: _partida),
                              
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: CupertinoColors.systemGrey.withOpacity(0.3),
                              ),
                              ),
                            ),
                          ],
                        ),
                      Padding(padding: EdgeInsets.all(8.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget>[
                            Text('Monto: ', style: TextStyle(fontSize: 14, color:CupertinoColors.systemPink)),
                            Container(
                            width: 280,
                            height: 30,
                            child:
                            CupertinoTextField(
                              controller: folioController = TextEditingController(text: _monto),
                              
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: CupertinoColors.systemGrey.withOpacity(0.3),
                              ),
                              ),
                            ),
                          ],
                        ),

                        Padding(padding: EdgeInsets.all(16.0)),
                                    Container(
                                      height: 50,
                                      width: 200,
                                      child: CupertinoButton(
                                        child: Text("Guardar"),
                                        padding: EdgeInsets.all(15.0),
                                        color: Color.fromRGBO(255, 127, 80,0.9),
                                        disabledColor: CupertinoColors.activeOrange,
                                        borderRadius: BorderRadius.circular(10.0),
                                        //padding: EdgeInsets.symmetric(horizontal: 100.0, vertical:10.0),
                 
                                        onPressed:(){
                                          //if(folioController.text != '' && codigoController.text != '' &&
                                          //partidaController.text != '' && montoController.text != ''){
                                            Firestore.instance
                                            .collection('requiscolect')
                                            .document().setData({
                                              'folio': _folio,
                                              'codigo': _codigo,
                                              'partida': _partida,
                                              'monto': _monto
                                            }
                                            );
                                          //}
                                          //else{
                                           // Text('Nulos');
                                          //}
                                        },
                                        
                                      ),
                                    ),
                    ],
                    
                    
                    
                  ),

                    
                ),
              ),
            ),
          ),
                        
                              
        ],
      ),
    );
  }
}