
import 'package:fl_components/router/app_routes.dart';
//import 'package:fl_components/screens/screens.dart';
import 'package:fl_components/themes/app_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp( const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Material App2',
//      home: const  ListView2Screen(),
      initialRoute: AppRoutes.initialRoute ,
      routes:   AppRoutes.getAppRoutes(),      
      onGenerateRoute: AppRoutes.onGenerateRoute,   // quitamos el parámetro y entonces coge el parámetro recibido por defecto
      theme: AppTheme.lightTheme,
    
    );
  }
}