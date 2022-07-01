import 'package:fl_components/themes/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children:  [
           const ListTile(
             leading: Icon(Icons.album, color: AppTheme.primary),
             title: Text('Soy un título'),
             subtitle: Text("hola caracola hola caracola hola caracola hola caracola hola caracola hola caracola hola caracola hola caracola 123 hola caracola hola caracola   ")
           ),
           Padding(     //Hace una separación en los objetos
//             padding: const EdgeInsets.all(8.0),
             padding: const EdgeInsets.only( right :5.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.end,   // colocamos los botones a la derecha
               children: [
                 TextButton(
                   onPressed: () {}, 
                  child: const Text("Cancel"),
                  ),
                 TextButton(
                   onPressed: () {}, 
                  child: const Text("OK"), 
//                  style: TextButton.styleFrom( primary: Colors.indigo )
                  ),
               ],

             ),
           )

        ],
        )
    );
  }
}