import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
List<String> lieux = ['Togo (TG)','Gabon (GA)','Benin (BN)'];
List<String> typeLocations = ['Appartement','Villa','Studio'];

const TextStyle dropDownLabelStyle = TextStyle(color: Colors.black38,fontSize: 16.0);
const TextStyle dropDownMenuItemStyle = TextStyle(color: Colors.black,fontSize: 16.0);

class RecherchePage extends StatefulWidget {
  @override
  _RecherchePageState createState() => _RecherchePageState();
}

class _RecherchePageState extends State<RecherchePage> with SingleTickerProviderStateMixin {
  var selectedLoationIndex = 0;
  bool isCollapsed  = true;
  double  screenWidth,  screenHeight;
  final Duration duration =  const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  var produitsList = [
    {
      'designation':'Sweat',
      'image':'assets/maison1.jpg',
      'quantite':'15',
      'prix':'10.000',
    },
    {
      'designation':'2',
      'image':'assets/maison1.jpg',
      'quantite':'10',
      'prix':'10.000',
    },
    {
      'designation':'3',
      'image':'assets/maison1.jpg',
      'quantite':'8',
      'prix':'10.000',
    },
    {
      'designation':'4',
      'image':'assets/maison1.jpg',
      'quantite':'15',
      'prix':'10.000',
    },
    {
      'designation':'5',
      'image':'assets/maison1.jpg',
      'quantite':'9',
      'prix':'10.000',
    },
    {
      'designation':'6',
      'image':'assets/maison1.jpg',
      'quantite':'4',
      'prix':'10.000',
    }
  ];


  @override
  void initState() {
//    SystemChrome.setPreferredOrientations([
//      DeviceOrientation.portraitUp,
//      DeviceOrientation.portraitDown,
//    ]);
//     _controller = AnimationController(value: this,duration: duration);
//     _scaleAnimation = Tween<double>(begin: 1,end: 0.8).animate(_controller);
//     _menuScaleAnimation = Tween<double>(begin: 0.5,end: 1).animate(_controller);
//     _slideAnimation = Tween<Offset>(begin:Offset(-1, 0),end: Offset(0, 0)).animate(_controller);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size  size  = MediaQuery.of(context).size;
    screenHeight  = size.height;
    screenWidth = size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 5.0,
        title: Text('Recherche', style: TextStyle(fontFamily: 'Montseratt', fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.bold,)),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(height: 10.0,),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.purple,),
                        SizedBox(width: 16.0,),
                        PopupMenuButton(
                          onSelected: (index){
                            setState(() {
                              selectedLoationIndex = index;
                            });
                          },
                          itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                            PopupMenuItem(
                              child: Text(lieux[0],style: dropDownMenuItemStyle,),
                              value: 0,
                            ),
                            PopupMenuItem(
                              child: Text(lieux[1],style: dropDownMenuItemStyle,),
                              value: 1,
                            ),
                            PopupMenuItem(
                              child: Text(lieux[2],style: dropDownMenuItemStyle,),
                              value: 2,
                            )
                          ],
                          child: Row(
                            children: <Widget>[
                              Text(lieux[selectedLoationIndex],style: dropDownLabelStyle,),
                              Icon(Icons.arrow_drop_down,color: Colors.black38,)
                            ],
                          ),
                        ),
                        Spacer(),
                        InkWell(
                            onTap: (){
                              setState(() {
                                if(isCollapsed)
                                  _controller.forward();
                                else
                                  _controller.reverse();
                                isCollapsed = !isCollapsed;
                              });
                            },
                            child: Icon(Icons.settings,color: Colors.black38,))
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Text('Que souhaitez-vous\n trouver?',style:TextStyle(color: Colors.purple,fontSize: 20.0),textAlign: TextAlign.center,),
                  SizedBox(height: 10.0,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      child: TextField(
                        controller: TextEditingController(text: typeLocations[1]),
                        style: dropDownMenuItemStyle,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 14.0,horizontal: 32.0),
                            suffixIcon: InkWell(
                              onTap: (){
                              },
                              child: Material(
                                elevation: 2.0,
                                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                child: Icon(Icons.search,),
                              ),
                            ),
                            border: InputBorder.none
                        ),
                      ),
                    ),),
                ],
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              height: 300,
              child: ListView(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text('Prix',style: TextStyle(color: Colors.black38,fontSize: 18.0),),
                          // Icon(Icons.credit_card,color: Colors.black38,)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'minimum',
                              ),
                              validator: (String value) {
                                return value.isEmpty ? 'Ce champ ne doit pas etre vide!' : null;
                              },
                            ),
                          ),
                          Container(
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  hintText: 'maximum'
                              ),
                              validator: (String value) {
                                return value.isEmpty ? 'Ce champ ne doit pas etre vide!' : null;
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text('Surface',style: TextStyle(color: Colors.black38,fontSize: 18.0),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'minimum',
                              ),
                              validator: (String value) {
                                return value.isEmpty ? 'Ce champ ne doit pas etre vide!' : null;
                              },
                            ),
                          ),
                          Container(
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  hintText: 'maximum'
                              ),
                              validator: (String value) {
                                return value.isEmpty ? 'Ce champ ne doit pas etre vide!' : null;
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Ville',
                    ),
                    validator: (String value) {
                      return value.isEmpty ? 'Ce champ ne doit pas etre vide!' : null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Quartier',
                    ),
                    validator: (String value) {
                      return value.isEmpty ? 'Ce champ ne doit pas etre vide!' : null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Nombre de pièces',
                    ),
                    validator: (String value) {
                      return value.isEmpty ? 'Ce champ ne doit pas etre vide!' : null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Nombre de salle de bain',
                    ),
                    validator: (String value) {
                      return value.isEmpty ? 'Ce champ ne doit pas etre vide!' : null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Nombre de cuisine',
                    ),
                    validator: (String value) {
                      return value.isEmpty ? 'Ce champ ne doit pas etre vide!' : null;
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget recherche(context){
    return AnimatedPositioned(
        duration: duration,
        top: 0,
        bottom: 0,
        left: isCollapsed ? 0 : 0.8 * screenWidth,
        right: isCollapsed ? 0 : -1 * screenWidth,
        child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
    elevation: 8,
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 5.0,
        title: Text('Recherche', style: TextStyle(fontFamily: 'Montseratt', fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.bold,)),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(height: 10.0,),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.purple,),
                        SizedBox(width: 16.0,),
                        PopupMenuButton(
                          onSelected: (index){
                            setState(() {
                              selectedLoationIndex = index;
                            });
                          },
                          itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                            PopupMenuItem(
                              child: Text(lieux[0],style: dropDownMenuItemStyle,),
                              value: 0,
                            ),
                            PopupMenuItem(
                              child: Text(lieux[1],style: dropDownMenuItemStyle,),
                              value: 1,
                            ),
                            PopupMenuItem(
                              child: Text(lieux[2],style: dropDownMenuItemStyle,),
                              value: 2,
                            )
                          ],
                          child: Row(
                            children: <Widget>[
                              Text(lieux[selectedLoationIndex],style: dropDownLabelStyle,),
                              Icon(Icons.arrow_drop_down,color: Colors.black38,)
                            ],
                          ),
                        ),
                        Spacer(),
                        InkWell(
                            onTap: (){
                              setState(() {
                                if(isCollapsed)
                                  _controller.forward();
                                else
                                  _controller.reverse();
                                isCollapsed = !isCollapsed;
                              });
                            },
                            child: Icon(Icons.settings,color: Colors.black38,))
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Text('Que souhaitez-vous\n trouver?',style:TextStyle(color: Colors.purple,fontSize: 20.0),textAlign: TextAlign.center,),
                  SizedBox(height: 10.0,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      child: TextField(
                        controller: TextEditingController(text: typeLocations[1]),
                        style: dropDownMenuItemStyle,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 14.0,horizontal: 32.0),
                            suffixIcon: InkWell(
                              onTap: (){
                              },
                              child: Material(
                                elevation: 2.0,
                                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                child: Icon(Icons.search,),
                              ),
                            ),
                            border: InputBorder.none
                        ),
                      ),
                    ),),
                ],
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              height: 300,
              child: ListView(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text('Prix',style: TextStyle(color: Colors.black38,fontSize: 18.0),),
                          // Icon(Icons.credit_card,color: Colors.black38,)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'minimum',
                              ),
                              validator: (String value) {
                                return value.isEmpty ? 'Ce champ ne doit pas etre vide!' : null;
                              },
                            ),
                          ),
                          Container(
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  hintText: 'maximum'
                              ),
                              validator: (String value) {
                                return value.isEmpty ? 'Ce champ ne doit pas etre vide!' : null;
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text('Surface',style: TextStyle(color: Colors.black38,fontSize: 18.0),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'minimum',
                              ),
                              validator: (String value) {
                                return value.isEmpty ? 'Ce champ ne doit pas etre vide!' : null;
                              },
                            ),
                          ),
                          Container(
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  hintText: 'maximum'
                              ),
                              validator: (String value) {
                                return value.isEmpty ? 'Ce champ ne doit pas etre vide!' : null;
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Ville',
                    ),
                    validator: (String value) {
                      return value.isEmpty ? 'Ce champ ne doit pas etre vide!' : null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Quartier',
                    ),
                    validator: (String value) {
                      return value.isEmpty ? 'Ce champ ne doit pas etre vide!' : null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Nombre de pièces',
                    ),
                    validator: (String value) {
                      return value.isEmpty ? 'Ce champ ne doit pas etre vide!' : null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Nombre de salle de bain',
                    ),
                    validator: (String value) {
                      return value.isEmpty ? 'Ce champ ne doit pas etre vide!' : null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Nombre de cuisine',
                    ),
                    validator: (String value) {
                      return value.isEmpty ? 'Ce champ ne doit pas etre vide!' : null;
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
        )
        )
    );
  }

  Widget resultatRecherche(context){
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale:_menuScaleAnimation,
        child: Container(
          height: screenHeight,
            padding: EdgeInsets.symmetric(
                horizontal: 5.0,vertical: 30.0),
            child: Column(
              children: <Widget>[
                   Container(
                    alignment: Alignment.topLeft,
                    child: Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            if(isCollapsed)
                              _controller.forward();
                            else
                              _controller.reverse();
                            isCollapsed = !isCollapsed;
                          });
                        },
                          child: Icon(Icons.clear,color: Colors.purple,)),
                    ),
                  ),
                Expanded(
                    child: ListView.builder(
                        itemCount: produitsList.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder:(BuildContext context, int index){
                          return ArtPublies(
                            artDesignation: produitsList[index]['designation'],
                            artImage: produitsList[index]['image'],
                            quantite: produitsList[index]['quantite'],
                            artPrix: produitsList[index]['prix'],
                          );
                        }
                    ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}

class ArtPublies extends StatelessWidget{
  final artDesignation;
  final artImage;
  final quantite;
  final artPrix;

  ArtPublies({this.artDesignation, this.artImage, this.quantite, this.artPrix});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(40.0, 5.0, 2.0, 5.0),
                    height: 140.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0)]
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(artDesignation,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,),
                              ),
                              Container(
                                child: Text('$artPrix FCFA',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,),
                              ),
                              Container(
                                child: Text('Quantité vendue: $quantite',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,),
                              ),
                              SizedBox(height: 20.0,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Supprimer'),
                                  SizedBox(width: 25.0,),
                                  Text('Modifier'),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20.0,
                    top: 15.0,
                    bottom: 15.0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 6.0)]
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          width: 110.0,
                          image: AssetImage(
                              artImage),
                          fit: BoxFit.cover,),
                      ),
                    ),
                  )
                ],
              )
            ]
        )
    );
  }

}


