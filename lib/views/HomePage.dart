import 'package:flutter/material.dart';
import 'package:my_app/views/AboutPage.dart';
import 'package:my_app/views/Login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => About()));
                // Navigator.popAndPushNamed(context, '/about');
              }),
          IconButton(
            icon: Icon(Icons.close),
            tooltip: 'Close session',
            onPressed: () {
              _performLogOut();
            },
          )
        ],
      ),
      body: ListView(children: [
        Stack(
          children: <Widget>[
            new Image(
              image: AssetImage('assets/trip.jpeg'),
              fit: BoxFit.cover,
              color: Colors.blueGrey,
              colorBlendMode: BlendMode.hue,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: new Text(
                'The Adventure of your life begins here',
                style: TextStyle(color: Colors.white, fontSize: 23),
              ),
            )
          ],
        ),
        new Container(
          height: 450,
          color: Colors.cyan,
        )
      ]),
    );
  }

  void _performLogOut() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
    // Navigator.pushNamed(context, '/');
  }
}
