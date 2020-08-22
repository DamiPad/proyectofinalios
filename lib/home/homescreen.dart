import 'package:proyectofinal/dependencias/localizacion.dart';
import 'package:proyectofinal/home/home.dart';
import 'package:proyectofinal/home/routes.dart';
import 'package:proyectofinal/requisiciones/lista_requi.dart';
import 'package:flutter/cupertino.dart';

 
 
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('Requisiones')
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.book),
              title: Text('Listado')
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.location),
              title: Text('Localizacion')
          )
        ],//contiene una lista
      ), 
      tabBuilder: (context,index){//como construir y como lojar
        //index ordinal base cero que indica que tab esta seleccionado o marcado
        return CupertinoTabView(
          routes: getApplicationRoutes(),
          builder: (context){
            switch(index){
              case 0:
                return MyHomePage();
                break;
              case 1:
                return RequisicionesScreen();
                break;
              case 2:
                return LocalizacionScreen();
                break;
            }
            return MyHomePage();
          }
        );
      }
    );
  }
}
