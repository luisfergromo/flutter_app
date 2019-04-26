import 'package:flutter/material.dart';
import 'package:my_app/models/placeholder_widget.dart';
import 'package:my_app/views/HomePage.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    PlaceHolderWidget(Colors.red),
    PlaceHolderWidget(Colors.green),
    PlaceHolderWidget(Colors.blue),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            new BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.teal,
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.map),
              title: Text('Map'),
              backgroundColor: Colors.red,
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
              backgroundColor: Colors.green,
            ),
            new BottomNavigationBarItem(
                icon: Icon(Icons.pets),
                title: Text('Pets'),
                backgroundColor: Colors.blue),
          ],
        ),
        body: _children[_currentIndex]
        // HomePage(),
        );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
