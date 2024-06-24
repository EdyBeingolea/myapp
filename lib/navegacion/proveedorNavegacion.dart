import 'package:flutter/material.dart';
import 'package:myapp/model/proveedor.dart';
import 'package:myapp/servicios/proveedorService.dart';

class Proveedornavegacion extends StatefulWidget {
  const Proveedornavegacion({Key? key}) : super(key: key);

  @override
  State<Proveedornavegacion> createState() => _ProveedornavegacionState();
}

class _ProveedornavegacionState extends State<Proveedornavegacion> {

   List<Proveedor>? _proveedor = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }
  void _getData() async{
    _proveedor = (await ProveedorService().getProveedor())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _proveedor == null || _proveedor!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _proveedor!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            child: Text(_proveedor![index].nombre[0]),
                          ),
                          Text("  "),
                          Text(_proveedor![index].id.toString()), 
                          Text("  "),
                          Text(_proveedor![index].nombre),
                          Text("  "),
                          Text(_proveedor![index].apellido)
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                );
              },
            ),
            floatingActionButton: ElevatedButton(onPressed: null, child: Text("Agregar")),
    );
  }
}