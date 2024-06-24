import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:myapp/model/proveedor.dart';
import 'package:myapp/servicios-secundarios/motodosProveedor.dart';

class ProveedorService {
  Future<List<Proveedor>?> getProveedor() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Proveedor> _model = proveedorFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
