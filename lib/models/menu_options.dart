



import 'package:flutter/material.dart' show IconData, Widget;  // solo importa el IconData

class MenuOption {
  final String route;   //ruta
  final IconData icon;
  final String name;   // nombre de la ruta
  final Widget screen;// la pantalla que se va a mostrar

  MenuOption( {
    required this.route, 
    required this.icon, 
    required this.name, 
    required this.screen
  });  



}

