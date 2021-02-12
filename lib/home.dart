import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mobiapp/coLocation.dart';
import 'package:mobiapp/location.dart';
import 'package:mobiapp/model/annonce.dart';
import 'package:mobiapp/publication.dart';
import 'package:mobiapp/recherche.dart';
import 'package:mobiapp/vente.dart';

import 'main.dart';


class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  PageController _myPage = PageController(initialPage: 0);
  List<Annonce> ope;

  List<Annonce> parseAnnonce(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Annonce>((json) => Annonce.fromJson(json)).toList();
  }

  Future<List<Annonce>> getAnnonce() async{

    final response = await http.get(
      Uri.parse("http://51.89.149.68:8080/mobi_article/api/annonces"),
      headers: <String,String>{
        "Content-type": "application/json; charset=UTF-8",
      },
    );

    if(response.statusCode < 200 || response.statusCode > 400 || json == null){
      print(response.statusCode);
    }if(response.statusCode==200){
      ope = parseAnnonce(response.body);
      print(ope);
      return ope;
    }

  }

  @override
  void initState() {
    getAnnonce();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          elevation: 5.0,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PublicationPage()));
              },
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              },
            ),
          ],
          title: Text('mobi', style: TextStyle(fontFamily: 'Montseratt', fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.bold,)),
          centerTitle: true,
        ),
        body: PageView(
          controller: _myPage,
          children: <Widget>[
            Center(
              child: Container(
                child: VentePage(),
              ),
            ),
            Center(
              child: Container(
                child: LocationPage(),
              ),
            ),
            Center(
              child: Container(
                child: CoLocationPage(),
              ),
            ),
            Center(
              child: Container(
                child: PublicationPage(),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>RecherchePage()));},
            backgroundColor: Colors.purple,
            child:Icon(Icons.search)
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 50,
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                      iconSize: 24.0,
                      padding: EdgeInsets.only(left: 28.0),
                      icon: Icon(Icons.shop, color: Colors.purple),
                      onPressed: (){
                        setState(() {
                          _myPage.jumpToPage(0);
                        });
                      }),
                  IconButton(
                      iconSize: 24.0,
                      padding: EdgeInsets.only(right: 28.0),
                      icon: Icon(Icons.local_offer, color: Colors.black38),
                      onPressed: (){
                        setState(() {
                          _myPage.jumpToPage(1);
                        });
                      }),
                  IconButton(
                      iconSize: 24.0,
                      padding: EdgeInsets.only(left: 28.0),
                      icon: Icon(Icons.supervisor_account, color: Colors.purple),
                      onPressed: (){
                        setState(() {
                          _myPage.jumpToPage(2);
                        });
                      }),
                  IconButton(
                      iconSize: 24.0,
                      padding: EdgeInsets.only(right: 28.0),
                      icon: Icon(Icons.lightbulb_outline, color: Colors.black38),
                      onPressed: (){
                        setState(() {
                          _myPage.jumpToPage(3);
                        });
                      })
                ]
            ),
          ),
        ),
    );
  }
}
