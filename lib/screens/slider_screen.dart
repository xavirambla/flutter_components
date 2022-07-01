import 'package:fl_components/themes/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
   const SliderScreen ({Key? key}) : super(key:  key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
   double _sliderValue=100;
   bool _sliderEnabled = false; 

   @override
   Widget build (BuildContext context){  
      return  Scaffold(
        appBar: AppBar(
          title: const Text('Sliders & Checks'),
        ),
/*
         body: SingleChildScrollView(
           child: Column(
             children: [
         //             Slider.adaptive    //se adaptan en ios y android , es decir se ve de manera distinta
                Slider.adaptive(
                  min:50,
                  max:400,
                  activeColor: AppTheme.primary,
         //                divisions: 10, // anclajes para tener valores fijos
                  value:_sliderValue, 
                  onChanged: ( value ){                   
                    _sliderValue = value;
                    setState(() {          });                  
                    }
                  ),
                  Image(
                    image: const  NetworkImage('https://i.pinimg.com/originals/96/56/7d/96567dff577fc5bdb4f58ca05c567be7.png'),
                    fit: BoxFit.contain,
                    width: _sliderValue,
                    
                    ),
                    const SizedBox( height: 200,)
             ],
           ),
         )
         */


         body: Column(
           children: [
         //             Slider.adaptive    //se adaptan en ios y android , es decir se ve de manera distinta
              Slider.adaptive(
                min:50,
                max:400,
                activeColor: AppTheme.primary,
         //                divisions: 10, // anclajes para tener valores fijos
                value:_sliderValue, 
                onChanged: _sliderEnabled
                 ? ( value ){                   
                  _sliderValue = value;
                  setState(() {          });                  
                  }
                  : null
                ),
                Checkbox(
                  value: _sliderEnabled, 
                  onChanged: ( value ) {
                    _sliderEnabled= value ??true;
                    setState(() {      });
                  }  
                  
//                  onChanged: null,  deshabilitado por defecto
                  ),
                  CheckboxListTile(
                    activeColor: Colors.green,
                    title: const Text('Habilitatr Slider'),
                    value: _sliderEnabled, 
                   onChanged: ( value ) {
                    _sliderEnabled= value ??true;
                    setState(() {      });
                  }  ),
                  Switch(
                    value: _sliderEnabled, 
                   onChanged: ( value ) {
                    _sliderEnabled= value;
                    setState(() {      });
                  }
                    ),
                    //SwitchListTile(
                    SwitchListTile.adaptive(
                    title: const Text('Habilitar Slider'),
                    value: _sliderEnabled, 
                   onChanged: ( value ) {
                    _sliderEnabled= value ;
                    setState(() {      });
                  } 
                      ),
                      const AboutListTile(),   // widget que permite ver la descripción de la aplicación
                Expanded(     // permite hacer un scroll
                 child: SingleChildScrollView(

                  child: Image(
                    image: const  NetworkImage('https://i.pinimg.com/originals/96/56/7d/96567dff577fc5bdb4f58ca05c567be7.png'),
                    fit: BoxFit.contain,
                    width: _sliderValue,
                    
                    ),
                ),
              ),
           ],
         )
      );
   }
}