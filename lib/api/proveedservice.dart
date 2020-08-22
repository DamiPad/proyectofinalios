import 'package:http/http.dart' show Client;
import 'package:proyectofinal/model/proveedores.dart';

class ProveedService{
  final String baseUrl = "https://proveedores20200821083135.azurewebsites.net";
  Client client = Client();

  Future<List<Proveedores>> getProveedores() async{
    final response = await client.get('$baseUrl/api/Proveedors');
    if(response.statusCode == 200){
      return proveedoresFromJson(response.body);
    }
    else {
      return null;
    }
  }



}