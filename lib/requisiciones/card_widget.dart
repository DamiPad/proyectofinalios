import 'package:proyectofinal/model/proveedores.dart';
import 'package:flutter/cupertino.dart';

class CupertinoCard extends StatelessWidget {
  const CupertinoCard({
    Key key,
    @required this.proveedoresm,
    @required this.onPressed,
    this.icon,
     
    }) : super(key: key);

    final Proveedores proveedoresm;
    final IconData icon;
    final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
  if(proveedoresm.imagen == 'video') return Container();
  final _card = Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        FadeInImage(
          height: 200,
          placeholder: AssetImage('assets/cupertino_activity_indicator.gif'),
          image:
              NetworkImage(proveedoresm.imagen),
          fit: BoxFit.cover,
          fadeInDuration: Duration(milliseconds: 200),
        ),
        Opacity(
          opacity: .6,
          child: Container(
            height: 90.0,
            width: double.infinity,
            color: CupertinoColors.black,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(proveedoresm.nombre,style: TextStyle(color: CupertinoColors.white),
                ),
                Flexible(
                  child: Column(
                    children: [
                      Text(proveedoresm.direccion,style:TextStyle(color: CupertinoColors.white, fontSize: 15.0),),
                      Text(proveedoresm.telefono,style:TextStyle(color: CupertinoColors.white, fontSize: 15.0),)
                      
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
         
        Positioned(
          top: 5.0,
          right: 5.0,

          child: CupertinoButton(
            child: Icon(icon,color: CupertinoColors.systemRed,size: 25.0,),
            onPressed: onPressed,       
          ),
        ),
      
      ],
    );


    return Container(
      //height: 100.0,
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        //color: CupertinoColors.activeBlue,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
              color: CupertinoColors.darkBackgroundGray.withOpacity(0.5),
              offset: Offset(0.0, 5.0),
              blurRadius: 8.0)
        ],
      ),
      child: ClipRRect(borderRadius: BorderRadius.circular(8.0), child: _card),
    );
  }
}