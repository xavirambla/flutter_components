import 'package:flutter/material.dart';

class ListView1Screen extends StatelessWidget {
  final options = const ['megaman','Metal Gear', 'Super Mario'];

   const ListView1Screen ({Key? key}) : super(key:  key);

   @override
   Widget build (BuildContext context){  
      return Scaffold(
        appBar: AppBar( 
          title:  const Text('Listview Tipo1') 
          ),
         body: ListView(
           children : [
              ...options.map(
                ( game ) =>  ListTile( title: Text( game ) , trailing: const Icon (Icons.arrow_forward_ios), )                
              ).toList() ,
   //           Divider(),
     //         Text("hola"),
           ],
           /*
           children: const[ 
             
            ListTile(
//              leading: Icon( Icons.alarm_off ),   //añade un icono
              title: Text("HolaMundo"),
              )

            ]
            */
         )
      );
   }
}