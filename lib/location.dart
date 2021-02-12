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
            Image.asset(item, fit: BoxFit.cover, width: 500.0),
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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          child: Column(
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
              SizedBox(height:10.0),
                  Center(
                      child: Text('Section Location',style: TextStyle(fontWeight: FontWeight.w200,fontSize: 20.0,color: Colors.purple),)
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
          ),
    );
  }
}
