import 'package:flutter/material.dart';
import 'package:myapp/navegacion/inicio.dart';
import 'package:myapp/navegacion/proveedorNavegacion.dart';

class Navegacion extends StatefulWidget {
  Navegacion({Key? key}) : super(key: key);

  @override
  _NavegacionState createState() => _NavegacionState();
}

class _NavegacionState extends State<Navegacion> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 127, 160, 231),
        title: const Center(
          child: Text('SnAcKeR', style: TextStyle(fontSize: 30)),
        ),
      ),
      body: Scaffold(
        bottomNavigationBar: NavigationBar(
          destinations: const <Widget>[
            NavigationDestination(
                icon: Icon(Icons.home_rounded), label: 'Inicio'),
            NavigationDestination(
                icon: Icon(Icons.person_2_rounded), label: 'Proveedor'),
            NavigationDestination(
                icon: Icon(Icons.credit_card), label: 'Venta'),
          ],
          selectedIndex: currentPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          indicatorColor: const Color.fromARGB(255, 140, 186, 204),
          animationDuration: const Duration(milliseconds: 500),
        ),
        body: [Inicio(), Proveedornavegacion(), Inicio()][currentPageIndex],
      ),
    );
  }
}
