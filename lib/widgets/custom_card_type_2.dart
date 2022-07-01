import 'package:fl_components/themes/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardType2 extends StatelessWidget {
   
   final String imageUrl; 
   final String? name; 

   const CustomCardType2 ({
     Key? key, 
     required this.imageUrl, 
     this.name  }
     ) : super(key:  key);



   @override
   Widget build (BuildContext context){  
      return  Card(
        clipBehavior: Clip.antiAlias ,    // obligar al contenido de las tarjetas , a no salirse de su interior
        shape: RoundedRectangleBorder(
          borderRadius : BorderRadius.circular(15),
        ),
        elevation:10,
        //shadowColor: AppTheme.primary,  // color de la sombra
        shadowColor: AppTheme.primary.withOpacity(0.5),  // color de la sombra , yla dibujamos más suave
        child:  Column(
          children:  [ 
         //    Image(image:  NetworkImage('https://www.theolivepress.es/wp-content/uploads/2019/02/High-frontier.jpg') ),
             FadeInImage(
               placeholder: const AssetImage('assets/jar-loading.gif'), 
               image: NetworkImage( imageUrl)  ,
               width: double.infinity,   // coge todo el ancho  posible Solo funciona  con widgets que están limitados
               height: 230,
               fit: BoxFit.cover, // la imagen se adapta a todo el espacio
               fadeInDuration: const Duration(milliseconds: 300), // la imagen aparece más rápido
               ),

               Container(
                 alignment: AlignmentDirectional.centerEnd,
                 padding: const EdgeInsets.only(right:20, top:10, bottom:10),   //espaciado
                 child: Text( name ?? 'No title1' )),


               if ( name!= null) 
               Container(
                 alignment: AlignmentDirectional.centerEnd,
                 padding: const EdgeInsets.only(right:20, top:10, bottom:10),   //espaciado
                 child: Text( name! )),


             /*
             FadeInImage(
               placeholder: AssetImage('assets/jar-loading.gif'), 
               image: NetworkImage('https://www.theolivepress.es/wp-content/uploads/2019/02/High-frontier.jpg')  
               ),
               */
            
        ],)
      );
   }
}
