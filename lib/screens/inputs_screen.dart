import 'package:fl_components/widgets/widgets.dart';
import 'package:flutter/material.dart';


class InputsScreen extends StatelessWidget {
   const InputsScreen ({Key? key}) : super(key:  key);

   @override
   Widget build (BuildContext context){  
     final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();    // guardará el key del formulario

     final Map<String, String> formValues={
       'first_name':  'Xavi',
       'last_name':   'Rambla',
       'email':       'xavirambla@yahoo.es',
       'password':    '123456',
       'role':        'Admin'
     };


      return Scaffold(
        appBar: AppBar(
          title: const Text('Input y Forms')
        ),
         body: SingleChildScrollView(  //permite hacer scroll
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal:20, vertical:10),
             child: Form(
               key: myFormKey,
               onChanged: (){} ,
               child: Column(
                 children:  [
                    CustomInputField(labelText: 'Nombre',   hintText: 'Nombre del usuario', formProperty: 'first_name', formValues: formValues, ),
                  const SizedBox( height: 30,),
                    CustomInputField(labelText: 'Apellido', hintText: 'Apellido del usuario', formProperty: 'last_name', formValues: formValues, ),
                  const SizedBox( height: 30,),
                    CustomInputField(labelText: 'Correo', hintText: 'Correo del usuario',  keyboardType: TextInputType.emailAddress,  formProperty: 'email', formValues: formValues, ),
                  const SizedBox( height: 30,),
                    CustomInputField(labelText: 'Contraseña', hintText: 'Contraseña' ,obscureText: true , formProperty: 'password', formValues: formValues),
                  const SizedBox( height: 30,),   

                  DropdownButtonFormField<String>(
                    items: const [
                       DropdownMenuItem( value: 'Admin',  child:  Text('Admin') ),
                       DropdownMenuItem( value: 'SuperUser',  child:  Text('SuperUser') ),
                       DropdownMenuItem( value: 'Developer',  child:  Text('Developer') ),                      
                     ], 
                    onChanged: ( value ){ 
//                      print(value);
                      formValues['role'] = value ?? 'Admin';
                    }
                    ),
                  const SizedBox( height: 30,),   


                  ElevatedButton(
                    child: const SizedBox(
                      width: double.infinity,
                      child: Center(child: Text('Guardar') ),
             
             
                      ),
                    onPressed: (){
                      //desactivar el teclado
                      FocusScope.of(context).requestFocus( FocusNode());  //quitamos el foco del teclado
                      if (!myFormKey.currentState!.validate()) { // saltan los validadores del widget y        
//                        print("Formulario no válido");
                        return;
                      }

                //      print (formValues);
                    }
                    )
                 ],
                 ),
             )
             ),

         )
         
         
      );
   }
}
