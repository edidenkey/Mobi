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
            Image.asset(item, fit: BoxFit.cover, width: 500.0),
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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                scrollDirection: Axis.vertical,
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: imageSliders,
            ),
          SizedBox(height:10.0),
          Center(
          child: Text('Section Vente',style: TextStyle(fontWeight: FontWeight.w200,fontSize: 20.0,color: Colors.purple),)
          ),
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Villas',style: TextStyle(fontWeight: FontWeight.w200,fontSize: 16.0,color: Colors.purple),),
              ),
              Villas(),
            ],
          ),
        ),
        ],
      )
    );
  }
}
