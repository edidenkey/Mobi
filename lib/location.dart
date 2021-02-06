import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.vertical,
                      autoPlay: true,
                    ),
                    items: imageSliders,
                  ),
                ],
              ),
              SizedBox(height:10.0),
              Center(
                  child: Text('Section Location',style: TextStyle(fontWeight: FontWeight.w200,fontSize: 20.0,color: Colors.purple),)
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Villas',style: TextStyle(fontWeight: FontWeight.w200,fontSize: 16.0,color: Colors.purple),),
              ),
              Villas(),
            ],
          ),
    );
  }
}
