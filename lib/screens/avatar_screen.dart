import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
   const AvatarScreen ({Key? key}) : super(key:  key);

   @override
   Widget build (BuildContext context){  
      return  Scaffold(
        appBar: AppBar(
            title: const Text('Avatars'),
            actions:[
              Container(
                margin: const EdgeInsets.only(right : 5) ,   //separación externa    - padding separación interna
                child: CircleAvatar(
                  child: const Text('SL'),
                  backgroundColor: Colors.indigo[900],
                ),
              )

            ]
        ),
        body: const Center(  
            //child: Text('AvatarScreen'),
            child: CircleAvatar(
              maxRadius: 100,   //tamaño del circle avatar
              backgroundImage:  NetworkImage('https://pbs.twimg.com/profile_images/2979193540/9de871bdbb1a07290f67a2aa9512b762_400x400.jpeg'),
            )
            ),
      );
   }
}