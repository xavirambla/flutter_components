import 'package:fl_components/themes/app_theme.dart';
import 'package:flutter/material.dart';

class IdeasScreen extends StatelessWidget {
  final ideas = const [
    ['answerthepublic.com','Busca las ideas de la gente.'],
    ['pexels.com','Descargar imágenes gratis.'],
    ['unsplash.com','Descargar imágenes gratis.'],
    ['picsum.photos','Descargar imágenes gratis.'],
    ['Proyect (SMART)','S Específico  M Medible  A Alcanzable  R Relevante  T Temporal'],
    ['generated.photos','Generar una cara artificial.'],
    ['voicemaker.in','Descargar imágenes gratis.'],
    ['tokkingheads.com','Juntar la foto y la cara para crear un video conjunto'],
    ['synthesia.io/santa','Santa Claus'],
    ['gaugan.org/gaugan2','Generar imágenes con inteligencia artificial']    ,
    ['generated.photos/anonymizer','Pones tu foto y te modifica para que no seas igual']    ,
    ['getavataaars.com','Generar un avatar de tu persona']      
    ];
  static int titlePos =0;
  static int subtitlePos =1 ;

   const IdeasScreen ({Key? key}) : super(key:  key);

   @override
   Widget build (BuildContext context){  
      return Scaffold(        
        appBar: AppBar( 
          title:  const Text('Ideas') ,

          ),
         body: ListView.separated(
           itemBuilder: (context, i) =>  ListTile( 
             title: Text( ideas[i][titlePos] ) , 
             subtitle:Text( ideas[i][ subtitlePos ] )  ,
             trailing: const Icon (Icons.arrow_forward_ios , color: AppTheme.primary   ,),
             onTap: (){
  //             final game = options[i];
      //         print (game);
              },
              )   ,                  //significa , construye algo
           separatorBuilder: ( _ , __ ) => const Divider(), 
           itemCount: ideas.length, )
      );
   }
}




