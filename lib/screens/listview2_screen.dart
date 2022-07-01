import 'package:fl_components/themes/app_theme.dart';
import 'package:flutter/material.dart';

class ListView2Screen extends StatelessWidget {
  final options = const ['megaman','Metal Gear1', 'Super Mario'];

   const ListView2Screen ({Key? key}) : super(key:  key);

   @override
   Widget build (BuildContext context){  
      return Scaffold(        
        appBar: AppBar( 
          title:  const Text('Listview Tipo 2') ,

          ),
         body: ListView.separated(
           itemBuilder: (context, i) =>  ListTile( 
             title: Text( options[i] ) , 
             trailing: const Icon (Icons.arrow_forward_ios , color: AppTheme.primary   ,),
             onTap: (){
  //             final game = options[i];
      //         print (game);
              },
              )   ,                  //significa , construye algo
           separatorBuilder: ( _ , __ ) => const Divider(), 
           itemCount: options.length, )
      );
   }
}


