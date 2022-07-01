import 'package:fl_components/themes/app_theme.dart';
import 'package:flutter/material.dart';
/*
class ListViewBuilderScreen extends StatelessWidget {
   const ListViewBuilderScreen ({Key? key}) : super(key:  key);

   @override
   Widget build (BuildContext context){  
      return Scaffold(
        backgroundColor: Colors.black,
         body: MediaQuery.removePadding(
           context: context,
           removeTop: true,
           removeBottom: true,
           
         
           child: ListView.builder(
             itemCount:10,
             itemBuilder: (BuildContext context, int index){
               return FadeInImage(
                 width: double.infinity,  // ponemos que ocupe toda la pantalla
                 height: 300,
                 fit: BoxFit.cover,  //poner las imagenes juntitas
                  placeholder: const AssetImage('assets/jar-loading.gif'),
                  image: NetworkImage('https://picsum.photos/500/300?image=${index+1}')
               );
             },
           ),
         )
      );
   }
}
*/

/*

class ListViewBuilderScreen extends StatefulWidget {
   const ListViewBuilderScreen ({Key? key}) : super(key:  key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {

  final List<int> imagesIds=[1,2,3,4,5,6,7,8,9,10];
  final ScrollController scrollController = ScrollController();

// cuando el widget se crea por primera vez 
  @override
  void initState() {

    super.initState();
    scrollController.addListener(() {
     // print( '${scrollController.position.pixels}, ${scrollController.position.maxScrollExtent}' );
      // cuando testemos a 500 pixeles del final, entonces cargamos 5 imágenes más.
      if (scrollController.position.pixels+500>=scrollController.position.maxScrollExtent){
         add5();
      }
    });
  }

  void add5(){
    final lastId = imagesIds.last;
    imagesIds.addAll(
       [1,2,3,4,5].map((e) => lastId +e)
    );
    setState(() {    });
  }

   @override
   Widget build (BuildContext context){  
      return Scaffold(
        backgroundColor: Colors.black,
         body: MediaQuery.removePadding(
           context: context,
           removeTop: true,
           removeBottom: true,
           
         
           child: ListView.builder(
             physics: const BouncingScrollPhysics() ,   //para que vaya también en ios
             controller: scrollController,     // todo widget que tiene scroll tiene un controller para cuando llegas al final
             itemCount:  imagesIds.length,
             itemBuilder: (BuildContext context, int index){
               return FadeInImage(
                 width: double.infinity,  // ponemos que ocupe toda la pantalla
                 height: 300,
                 fit: BoxFit.cover,  //poner las imagenes juntitas
                  placeholder: const AssetImage('assets/jar-loading.gif'),
                  image: NetworkImage('https://picsum.photos/500/300?image=$index')
               );
             },
           ),
         )
      );
   }
}
*/
class ListViewBuilderScreen extends StatefulWidget {
   const ListViewBuilderScreen ({Key? key}) : super(key:  key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {

  final List<int> imagesIds=[1,2,3,4,5,6,7,8,9,10];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;

// cuando el widget se crea por primera vez 
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
     // print( '${scrollController.position.pixels}, ${scrollController.position.maxScrollExtent}' );
      // cuando testemos a 500 pixeles del final, entonces cargamos 5 imágenes más.
      if (scrollController.position.pixels+500>=scrollController.position.maxScrollExtent){
//         add5();
         fetchData();
      }
    });
  }

  


  Future fetchData() async {
    if (isLoading) return ;  // si está cargando no haremos nada

    isLoading = true;
    setState(() {    });
    await Future.delayed(const Duration(seconds:3));  // hacemos un delay de 3 segundos para hacer una espera
    add5();
    isLoading = false;
    setState(() {   });    
    
 
    // solo realizaremos esta animación si estamos al final de la lista.
    if ( scrollController.position.pixels+ 100 <= scrollController.position.maxScrollExtent ) return;
        //nos indica que ocurre cuando termina la carga mediante una animación para indicar al usuario que se han cargado todos los datos.
    scrollController.animateTo(
      scrollController.position.pixels +120, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.fastOutSlowIn
      );
      
    
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds:2));  // hacemos un delay de 3 segundos para hacer una espera
    final lastId = imagesIds.last;   // cojo donde me quede, y añado 5 más
    imagesIds.clear();
    imagesIds.add(lastId+1);  // agrego la última que tenía, y le pongo 1 para que sea diferente
    add5();  // añado otras 5


  }

  void add5(){
    final lastId = imagesIds.last;
    imagesIds.addAll(
       [1,2,3,4,5].map((e) => lastId +e)
    );
    setState(() {    });
  }

   @override
   Widget build (BuildContext context){  
     final size= MediaQuery.of(context).size;  // nos dice el tamaño de la pantalla

      return Scaffold(
        backgroundColor: Colors.black,
         body: MediaQuery.removePadding(
           context: context,
           removeTop: true,
           removeBottom: true,
           
         
           child: Stack(   //pone un  widget encima de otro.
             children: [
               // Pull to Refresh 
               RefreshIndicator(               
                 color: AppTheme.primary,
                 onRefresh:  onRefresh,   // cuadno llega al principio, hacer lo siguiente
                 child: ListView.builder(
                   physics: const BouncingScrollPhysics() ,   //para que vaya también en ios
                   controller: scrollController,     // todo widget que tiene scroll tiene un controller para cuando llegas al final
                   itemCount:  imagesIds.length,
                   itemBuilder: (BuildContext context, int index){
                     return FadeInImage(
                       width: double.infinity,  // ponemos que ocupe toda la pantalla
                       height: 300,
                       fit: BoxFit.cover,  //poner las imagenes juntitas
                        placeholder: const AssetImage('assets/jar-loading.gif'),
                        image: NetworkImage('https://picsum.photos/500/300?image=$index')
                     );
                   },
                 ),
               ),
               
              if (isLoading) Positioned(
                 bottom: 40,
                 left: size.width*0.5 -30,  // centramos el widget
                 child: const _LoadingIcon(),

                 )
          

             ],
           ),
         )
      );
   }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height:60,
      width: 60,
      decoration: const BoxDecoration(
        color:  Colors.green,
        shape: BoxShape.circle,
        ),
      child: const CircularProgressIndicator( color: AppTheme.primary)
    );
  }
}
