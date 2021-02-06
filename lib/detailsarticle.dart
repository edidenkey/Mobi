import 'package:flutter/material.dart';


class DetailsArticles extends StatefulWidget {
  final id;
  final image;
  final quartier;
  final prix;

  const DetailsArticles({Key key, this.id, this.image, this.quartier, this.prix}) : super(key: key);

  @override
  _DetailsArticlesState createState() => _DetailsArticlesState();
}

class _DetailsArticlesState extends State<DetailsArticles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0)]
                  ),
                  child: Hero(
                    tag: widget.id,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image(
                        image: AssetImage(widget.image),
                        fit: BoxFit.cover,),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
                  child:   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                        iconSize: 30.0,
                        color: Colors.purple,),
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.star_border),
                            onPressed: () {},
                            iconSize: 30.0,
                            color: Colors.purple,),
                          IconButton(
                            icon: Icon(Icons.filter_list),
                            onPressed: (){},
                            iconSize: 30.0,
                            color: Colors.purple,),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  left: 20.0,
                  bottom: 20.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.prix,
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.w600,
                            fontSize: 30.0,
                            letterSpacing: 1.2
                        ),),
                      Row(
                        children: <Widget>[
                          Icon(Icons.location_on,size: 15.0,color: Colors.purple,),
                          SizedBox(width: 5.0,),
                          Text(widget.quartier,
                            style: TextStyle(
                              color: Colors.purple,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold
                            ),),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('Description',style: TextStyle(fontWeight: FontWeight.w200,fontSize: 16.0,color: Colors.purple),),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Appartement situé en plein coeur de Lomé avec une blle vue sur la lagune.Il possède trois chambres et deux salles de bain.En outre il dispose d\'un salon et d\'une salle à manger.',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18.0,color: Colors.purple,),),
            ),
          ],
        ),
    );
  }
}
