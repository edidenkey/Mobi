import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobiapp/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Homepage(),
        routes: <String, WidgetBuilder> {
          '/homePage': (BuildContext context) => new Homepage(),
        }
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: 300.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.purple
                ),
              ),
              Center(
                child: Card(
                  elevation: 10.0,
                  child: Container(
                    height: 300.0,
                    width:300.0,
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0,vertical: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Connexion',
                            style: TextStyle(color: Colors.black38,fontFamily: 'OpenSans',fontSize: 30.0,fontWeight: FontWeight.bold),),
                          SizedBox(height: 20,),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Username/Pseudo',
                            ),
                            validator: (String value) {
                              return value.isEmpty ? 'Ce champ ne doit pas etre vide!' : null;
                            },
                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Mot de passe',
                            ),
                            validator: (String value) {
                              return value.isEmpty ? 'Ce champ ne doit pas etre vide!' : null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 437.0,
                right: 50.0,
                child: Container(
                  width: 150.0,
                  child: RaisedButton(
                    elevation: 5.0,
                    onPressed: () {
                   Navigator.pushReplacementNamed(context, '/homePage');
                    },
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)
                    ),
                    color: Colors.purple,
                    child: Text('VALIDER', style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.5,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans'
                    ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 530,
                child: GestureDetector(
                  onTap: () {
// Navigator.push(context, MaterialPageRoute(builder: (context)=>PageAdminFournisseur()));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.0,vertical: 20.0),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text:"Vous n'avez pas de compte? ",
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            )
                        ),
                        TextSpan(
                            text:'Créer un compte',
                            style: TextStyle(
                              color: Colors.purple,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            )
                        )
                      ]),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

  }
}




