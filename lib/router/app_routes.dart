import 'package:flutter/material.dart';

import 'package:fl_components/models/models.dart';
import 'package:fl_components/screens/screens.dart';


class AppRoutes {

  static const initialRoute='home';

  static final menuOptions = <MenuOption>[
    //todo:borrar home
    //MenuOption(route: 'home',name:'Home Screen', screen: const HomeScreen() , icon: Icons.home ),
    MenuOption(route: 'listview1',name:'listview1 Screen', screen: const ListView1Screen() , icon: Icons.list_alt_rounded ),
    MenuOption(route: 'listview2',name:'listview2 Screen', screen: const ListView1Screen() , icon: Icons.list_sharp ),    
    MenuOption(route: 'alert',name:'Alert Screen', screen: const AlertScreen() , icon: Icons.add_alert_outlined ),        
    MenuOption(route: 'card',name:'Card Screen', screen: const CardScreen() , icon: Icons.add_alert_outlined ),        
    MenuOption(route: 'avatar',name:'Circle Avatar Screen', screen: const AvatarScreen() , icon: Icons.supervised_user_circle_outlined ),        
    MenuOption(route: 'animated',name:'Animated Screen', screen: const AnimatedScreen() , icon: Icons.play_arrow_outlined),        
    MenuOption(route: 'ideas',name:'Ideas Screen', screen: const IdeasScreen() , icon: Icons.play_arrow_outlined),            
    MenuOption(route: 'inputs',name:'Text Inputs', screen: const InputsScreen() , icon: Icons.input_rounded),            
    MenuOption(route: 'slider',name:'Slider & checks', screen: const SliderScreen() , icon: Icons.slow_motion_video_outlined),            
    MenuOption(route: 'listviewbuilder',name:'InfiniteScroll & Pull to refresh', screen: const ListViewBuilderScreen() , icon: Icons.slow_motion_video_outlined),                        
    
  ];

  static  Map<String, Widget Function(BuildContext)> getAppRoutes(){
    Map<String, Widget Function(BuildContext)> appRoutes ={   };
     
     // lo saco del menu per lo mantengo en la página principal
    appRoutes.addAll( { 'home' :  (BuildContext context) => const  HomeScreen() } );  
     
    for (final option in menuOptions ) {
      appRoutes.addAll( {  option.route   : ( BuildContext context) => option.screen   } ) ;
    }

    return appRoutes;
  }

/*
  static Map<String, Widget Function(BuildContext)> routes ={
              'home'      : ( BuildContext context    ) => const  HomeScreen() ,                  
              'listview1' : ( BuildContext context    ) => const  ListView1Screen() ,
              'listview2' : ( BuildContext context    ) => const  ListView2Screen() ,
              'alert'     : ( BuildContext context    ) => const  AlertScreen() ,
              'card'      : ( BuildContext context    ) => const  CardScreen() ,
  };
*/


  static Route<dynamic> onGenerateRoute (RouteSettings settings){
        return MaterialPageRoute(
          builder:  (context) =>  const AlertScreen() );

  }




}