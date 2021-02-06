import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobiapp/villas.dart';

final List<String> imgList = [
  "assets/maison1.jpg",
  "assets/maison2.jpg",
  "assets/maison3.jpg",
  "assets/maison4.png"
];

final List<Widget> imageSliders = imgList.map((item) => Container(
  child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.asset(item, fit: BoxFit.cover, width: 1000.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Text(
                  'No. ${imgList.indexOf(item)} image',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        )
    ),
  ),
)).toList();

class VentePage extends StatefulWidget {
  @override
  _VentePageState createState() => _VentePageState();
}

class _VentePageState extends State<VentePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Column(children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              items: imageSliders,
            ),
          ],
          ),
          SizedBox(height:10.0),
          Center(
          child: Text('Section Vente',style: TextStyle(fontWeight: FontWeight.w200,fontSize: 20.0,color: Colors.purple),)
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('Villas',style: TextStyle(fontWeight: FontWeight.w200,fontSize: 16.0,color: Colors.purple),),
          ),
          Villas(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('Studios',style: TextStyle(fontWeight: FontWeight.w200,fontSize: 16.0,color: Colors.purple),),
          ),
         // Villas(),
        ],
      )
    );
  }
}
