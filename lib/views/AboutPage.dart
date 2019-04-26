import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new FlutterLogo(
              size: 45.0,
              //size: _iconAnimation.value * 100,
            ),
          ),
          new Text('App made with ♥'),
          /*
          new GestureDetector(
            child: new Text('Click Here', style: TextStyle(fontSize: 43.0,color: Colors.blue, decoration: TextDecoration.underline),),
            onTap: () {
              // print('Taped');
              Navigator.push(context, MaterialPageRoute(builder: (context)=> webview()));
            },
          ),
           */
        ],
      )),
    );
  }
}