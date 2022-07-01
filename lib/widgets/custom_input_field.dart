
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  
  final  String formProperty;
  final Map<String, String> formValues;
  
  const CustomInputField({
    Key? key, 
    this.hintText, 
    this.labelText, 
    this.helperText,
    this.icon, 
    this.suffixIcon, 
    this.keyboardType, 
    this.obscureText = false,
    required this.formProperty, 
    required this.formValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true, // cuando se construye , pone el foco
      initialValue: '',                   
      textCapitalization: TextCapitalization.words,  // que se ponga las palabras con la primera letra en mayúscula
//      keyboardType: TextInputType.emailAddress,    // como queremos que aparezca el teclado del navegador
      keyboardType:   keyboardType,   
      obscureText: obscureText, // para el password

      onChanged: (value){
        formValues[formProperty]= value;
        
      },
      //validar el contenido
      validator:(value) {

        if (value ==null) return 'Este Campo es requerido';
//                     return 'hola mundo';     // si devuelve un string, es el mensaje de error que aparecerá al usuario.
        return value.length<3 ? 'Mínimo de 3 caracteres' : null;
      },
      //autovalidateMode: AutovalidateMode.always,  // no se utiliza pq 
      autovalidateMode: AutovalidateMode.onUserInteraction,  // es la recomendada . Solo valida cuando realiza una interacción
      
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText ,
        helperText: helperText,
//        counterText: '3 caracteres',
        suffixIcon:  suffixIcon==null ? null :  Icon (  suffixIcon ),
        icon:  icon==null ? null :  Icon (  icon ),
        /*
        prefixIcon:  Icon (Icons.group_outlined),        
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green
            ),
          ),
        border:  OutlineInputBorder(
          borderRadius: BorderRadius.only(
             bottomLeft: Radius.circular(10) ,
             topRight: Radius.circular(10) 
             )
          )
          */
       ),
       
    );
  }
}