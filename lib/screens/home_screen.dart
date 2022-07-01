//import 'package:fl_components/screens/screens.dart';
//import 'package:fl_components/models/models.dart';
import 'package:fl_components/router/app_routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   const HomeScreen ({Key? key}) : super(key:  key);

   @override
   Widget build (BuildContext context){  
     
      return Scaffold(
        appBar:AppBar(
          title: const Text("Componentes en Flutter"),
        ),
         body: 
         ListView.separated(
           itemBuilder:  (context, index) => ListTile(
             title:  Text( AppRoutes.menuOptions[index].name ),
             leading:  Icon( AppRoutes.menuOptions[index].icon , color: Colors.indigo ),
             onTap: () { 
                  //gettex
                  /*
                  final route = MaterialPageRoute(builder:  (context)=> const ListView1Screen() );
                  Navigator.push( context, route );   //viajar a otra pantalla

//                  Navigator.pushReplacement(context, route)   ;  //destruye la ruta anterior  , por ejemplo útil al hacer el login (una vez hecho, no hace falta tirar atrás)
*/
                  Navigator.pushNamed(context, AppRoutes.menuOptions[index].route);


             },
           ), 
           separatorBuilder: (_,__) => const Divider(), 
           itemCount: AppRoutes.menuOptions.length )
      );
   }
}