import 'dart:convert';

class Proveedores{
  int id;
  String nombre;
  String direccion;
  String telefono;
  String imagen;

  Proveedores({
    this.id,
    this.nombre,
    this.direccion,
    this.telefono,
    this.imagen,

  });

  factory Proveedores.fromJson(Map<String, dynamic> map){
    return Proveedores(
      id: map['Id'],
      nombre: map['Nombre'],
      direccion: map['Direccion'],
      telefono: map['Telefono'],
      imagen: map['Imagen'],
    );
  }

  Map<String, dynamic>toJson(){
    return {"Id": id, 
            "Nombre": nombre, 
            "Direccion":direccion, 
            "Telefono":telefono,
            "Imagen": imagen,
          };
  }


  @override
  String toString(){
    return 'Materias{Id:$id, Nombre:$nombre, Direccion:$direccion, Telefono:$telefono, Imagen:$imagen}';
  }
}


List<Proveedores> proveedoresFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<Proveedores>.from(data.map((item)=>
  Proveedores.fromJson(item)));

}

String proveedoresToJson(Proveedores data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}