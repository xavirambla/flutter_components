import 'package:flutter/material.dart';
import 'package:fl_components/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
   const CardScreen ({Key? key}) : super(key:  key);

   @override
   Widget build (BuildContext context){  
      return  Scaffold(
        appBar: AppBar(title: const Text("Card Widget")),
         body: ListView(
           padding: const EdgeInsets.symmetric( horizontal:20, vertical: 10) ,  //separación simetrica (tanto derecha cómo izquierda)
           children: const [
             CustomCardType1(),
             SizedBox ( height: 10,)  , //añadimos un espaciado entre las tarjetas
            CustomCardType2(imageUrl: 'https://www.theolivepress.es/wp-content/uploads/2019/02/High-frontier.jpg', name:'un paisaje' ),
             SizedBox ( height: 10,)  , //añadimos un espaciado entre las tarjetas
            CustomCardType2(imageUrl: 'https://www.creativefabrica.com/wp-content/uploads/2021/06/12/mountain-landscape-illustration-design-b-Graphics-13326021-1.jpg',),
            SizedBox ( height: 10,)  , //añadimos un espaciado entre las tarjetas
            CustomCardType2(imageUrl: 'https://www.ninoversace.com/wp-content/uploads/landscape-mountains-sky-4843193.jpg',),                        
           ],

         )
      );
   }
}

