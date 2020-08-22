import 'package:flutter/cupertino.dart';
import 'package:proyectofinal/api/proveedservice.dart';
import 'package:proyectofinal/model/proveedores.dart';
import 'package:proyectofinal/requisiciones/card_widget.dart';

class LocalizacionScreen extends StatefulWidget {
  LocalizacionScreen({Key key}) : super(key: key);

  @override
  _LocalizacionScreenState createState() => _LocalizacionScreenState();
}

class _LocalizacionScreenState extends State<LocalizacionScreen> {
  ProveedService apiService;

  @override
  void initState() {
    super.initState();
    apiService = ProveedService();
  }
  
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      
       navigationBar: CupertinoNavigationBar(
         backgroundColor: Color.fromRGBO(217, 136, 128, 0.5),
        middle: Text("Proveedores del Estado", style: TextStyle(fontSize:25, color:CupertinoColors.white)),
          
        ),
       
        child: CupertinoApp(
        debugShowCheckedModeBanner: false,
        home: _proveedoresList(),
       
        ),
       
      );
  }

  Widget _proveedoresList(){
    return FutureBuilder(
      future: apiService.getProveedores(),
      builder: (BuildContext context, AsyncSnapshot<List<Proveedores>> snapshot){
      if (snapshot.hasData){
        return _cardList(snapshot.data);
      }else {
       return Center(child: CupertinoActivityIndicator(),);
      }
      },                     
    );
  }

  Widget _cardList(List<Proveedores> imageList){
   return ListView.builder(
   itemCount: imageList.length,
   itemBuilder: (BuildContext context, int index){
   return CupertinoCard(
      proveedoresm:imageList[index],
      onPressed:() => print(''),
      icon: CupertinoIcons.heart_solid,
      );
    },
    );
 }
}