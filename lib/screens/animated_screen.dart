
import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
   const AnimatedScreen ({Key? key}) : super(key:  key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double _width = 50;
  double _height = 50;
  Color _color = Colors.indigo;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);

  void changeShape(){
    
    final random = Random();
    _width =  random.nextInt(300).toDouble()+70; // ponemos el 70 para que el mínimo sea 70
    _height = random.nextInt(300).toDouble()+70; // ponemos el 70 para que el mínimo sea 70
    _color = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1
    );
        _borderRadius = BorderRadius.circular( random.nextInt(100).toDouble()+10 );
    setState(() {    });
  }

   @override
   Widget build (BuildContext context){  
      return  Scaffold(
        appBar: AppBar(
          title: const Text ('Animated Container')
        ),
         body: Center(  
//            child: Container(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),  // ahora está animado y tarda 400 ms en hacerse
              curve: Curves.easeOutCubic,
              width: _width,
              height: _height,
//              color: Colors.red,   // no podemos tener un color y un decoration juntos
              decoration: BoxDecoration(
                color: _color,
                borderRadius: _borderRadius
              ),
              
              )
            ),
       floatingActionButton: FloatingActionButton(
         child: const Icon(Icons.play_circle_outline , size:35),
         onPressed: () {
            changeShape();
         } ,

         ),            
      );
   }
}