//import 'package:fl_components/themes/app_theme.dart';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
   const AlertScreen ({Key? key}) : super(key:  key);


   void displayDialogIOS( BuildContext context ){
      showCupertinoDialog(
        barrierDismissible: false,  
        context: context, 
        builder: (context){
          return CupertinoAlertDialog(
            title: const Text('Titulo'),
           content: Column ( 
             mainAxisSize: MainAxisSize.min,   // cuanto ocupará la columna (por defecto está al máximo)
             children: const [
               Text("este es el contenido de la alerta"),
               SizedBox(height: 10),
               FlutterLogo( size:100),
             ]
           ),
           actions:[
             TextButton(
               onPressed: ()=>Navigator.pop(context), 
               child:  const Text ('Cancelar' , style: TextStyle(color: Colors.red))
               ),
             TextButton(
               onPressed: ()=>Navigator.pop(context), 
               child:  const Text ('Ok')
               )               
           ]            
          );
        }
        );
   }


   void displayDialogAndroid( BuildContext context ){
     showDialog(
//       barrierDismissible: true,  // poder cerrar el dialogo cuanod pulsas en la sombra
       barrierDismissible: false,  // cierre manual
       context:context,   //con satefullwidget coge el context automaticament
       builder: ( context ){
         return AlertDialog(
           elevation:5,
           title: const Text('Titulo'),
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10) ),   // poner la tarjeta con bordes redondeados.
           content: Column ( 
             mainAxisSize: MainAxisSize.min,   // cuanto ocupará la columna (por defecto está al máximo)
             children: const [
               Text("este es el contenido de la alerta"),
               SizedBox(height: 10),
               FlutterLogo( size:100),
             ]
           ),
           actions:[
             TextButton(
               onPressed: ()=>Navigator.pop(context), 
               child:  const Text ('Cancelar')
               ),
             TextButton(
               onPressed: ()=>Navigator.pop(context), 
               child:  const Text ('Ok')
               )                
           ]
         );
       }
     );

   }

   @override
   Widget build (BuildContext context){  
      return  Scaffold(
         body:   Center(  
            child:  ElevatedButton(
              /*
              style:  ElevatedButton.styleFrom(
                primary:  Colors.red,
                shape: StadiumBorder(),
                elevation: 3.0 
                ),
                */

              child: const  Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20, vertical:15 ),
                child:   Text ('Mostrar alerta2' ,style: TextStyle(fontSize: 20)   )
              ),
//              onPressed:  ()=> displayDialogAndroid(context)   // mandamos una referencia a la función
   //           onPressed:  ()=> displayDialogIOS(context)   // mandamos una referencia a la función
              onPressed:() => Platform.isAndroid 
                                ? displayDialogAndroid(context)
                                : displayDialogIOS(context)
              ),

            ),
            floatingActionButton: FloatingActionButton(
              child:  const  Icon( Icons.close ),
              onPressed: () { 
                Navigator.pop(context);   // cierra la pantalla actual y vuelve a la pantalla anterior
                }
              )
             );
     
   }
}