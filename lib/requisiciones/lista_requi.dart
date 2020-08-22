import 'package:proyectofinal/home/home.dart';
import 'package:proyectofinal/home/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RequisicionesScreen extends StatefulWidget {
  RequisicionesScreen({Key key}) : super(key: key);

  @override
  _RequisicionesScreenState createState() => _RequisicionesScreenState();
}

class RequiInfo{
  final String folio;
  final String codigo;
  final String partida;
  final String monto;
  RequiInfo({
    this.folio, this.codigo, this.partida, this.monto}
  );
}




class _RequisicionesScreenState extends State<RequisicionesScreen> {
 @override
  void initState() {
    super.initState();

    Firestore.instance
    .collection('requiscolect')
    .snapshots()
    .listen((data) =>
        data.documents.forEach((doc) => print(doc['folio'])));
  }
 
  Widget build(BuildContext context) {
    return Material(
        child: CupertinoPageScaffold(
        child: CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              backgroundColor:Color.fromRGBO(217, 136, 128, 0.7),
              largeTitle: Text('Listado de Requisiciones', style: TextStyle(fontSize:20, color:CupertinoColors.white),)

            ),
            SliverSafeArea(
              sliver: StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('requiscolect').snapshots(),
                builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                    if(!snapshot.hasData) return SliverToBoxAdapter(
                      child: CupertinoActivityIndicator());
                      return SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index){
                                return _buildListItem(context,snapshot.data.documents[index]);
                              },childCount: snapshot.data.documents.length,
                                
                            ),
                      );
                },) 
                              )
                            ],
                          )
                        ),
    );
  }
                  
  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {

      return Container(
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
         
          children: [
            Column(
              

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(padding: EdgeInsets.all(13.0)),
                Align( alignment: Alignment.topLeft, 
                child: Text('Requisicion:  ${document['folio']}',style: TextStyle(),)),
               

                Align( alignment: Alignment.topLeft, 
                child: Text(document['codigo'],style: TextStyle(),)),
                
                
                Align( alignment: Alignment.topLeft, 
                child: Text('Partida: ${document['partida']}',style: TextStyle(),)),
                

                Align( alignment: Alignment.topLeft, 
                child: Text('Monto: ${document['monto']}',style: TextStyle(),)),
                
                //

            ],),
            ClipOval(
              child: Material(// button color
                child: InkWell(
                  splashColor: Color.fromRGBO(255, 127, 80, 0.9), // inkwell color
                  child: SizedBox(child: Icon(CupertinoIcons.add_circled,size: 30,)),
                  onTap: () {   
                    //Navigator.of(context).pushReplacementNamed('/'); 
                    //Navigator.of(context).pushNamed('/');
                    
                    Navigator.push(context, CupertinoPageRoute(
                    builder: (context) => MyHomePage()));
                    
                  },
                ),
              ),
            ),
            //Icon(CupertinoIcons.add_circled, size: 30,),
            Icon(CupertinoIcons.minus_circled, size: 30, color: Color.fromRGBO(255, 127, 80,0.9)),
          ],
        ),
      );

  }
}