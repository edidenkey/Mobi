import 'package:flutter/material.dart';
import 'package:mobiapp/detailsarticle.dart';


class Villas extends StatefulWidget {
  @override
  _VillasState createState() => _VillasState();
}

class _VillasState extends State<Villas> {

  var articlesList = [
    {
      'id':'1',
      'image':'assets/maison1.jpg',
      'quartier':'Agoe Telessou',
      'prix':'10.000',
    },
    {
      'id':'2',
      'image':'assets/maison2.jpg',
      'quartier':'Totsi',
      'prix':'150.000',
    },
    {
      'id':'3',
      'image':'assets/maison3.jpg',
      'quartier':'Adidoadin',
      'prix':'130.000',
    },
    {
      'id':'4',
      'image':'assets/maison4.png',
      'quartier':'Adidogome',
      'prix':'100.000',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      child: ListView.builder(
          itemCount: articlesList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder:(BuildContext context, int index){
            return SingleVilla(
              id: articlesList[index]['id'],
              image: articlesList[index]['image'],
              prix:  articlesList[index]['prix'],
              quartier: articlesList[index]['quartier']
            );
          }

      ),
    );
  }
}

class SingleVilla extends StatelessWidget {
 final id;
 final image;
 final quartier;
 final prix;

  const SingleVilla({this.id,this.image, this.quartier, this.prix});


  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: id,
          child: Material(
            child: Container(
              width: 190.0,
              child: InkWell(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsArticles(id: id,image: image,quartier: quartier,prix: prix,)));},
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Positioned(
                        bottom: 5.0,
                        child: Container(
                          height: 120.0,
                          width: 180.0,
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                Text(prix,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2),),
                                Row(
                                  children: [
                                    Icon(Icons.location_on,size: 10.0,color: Colors.grey,),
                                    SizedBox(width: 5.0,),
                                    Text(quartier,
                                      style: TextStyle(
                                        color: Colors.grey,),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 6.0)]
                      ),
                      child: Stack(
                        children: <Widget>[
                           ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image(
                                height: 170.0,
                                width: 150.0,
                                image: AssetImage(image),
                                fit: BoxFit.cover,),
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
  }
}

