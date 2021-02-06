import 'package:flutter/material.dart';
import 'package:mobiapp/coLocation.dart';
import 'package:mobiapp/location.dart';
import 'package:mobiapp/publication.dart';
import 'package:mobiapp/recherche.dart';
import 'package:mobiapp/vente.dart';


class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  PageController _myPage = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          elevation: 5.0,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RecherchePage()));
              },
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: (){},
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
            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>PublicationPage()));},
            backgroundColor: Colors.purple,
            child:Icon(Icons.share)
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
