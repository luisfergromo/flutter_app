import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  final TextEditingController _userName = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: new Padding(
          child: Form(
              child: new Theme(
                  data: new ThemeData(
                      //backgroundColor: Colors.black,
                      brightness: Brightness.light,
                      primarySwatch: Colors.teal,
                      inputDecorationTheme: new InputDecorationTheme(
                          labelStyle: new TextStyle(
                              //color: Colors.blue,
                              fontSize: 20.0))),
                  child: new Column(
                    children: <Widget>[
                      Text('Para registrate necesitamos los siguientes datos:'),
                      new TextFormField(
                        controller: _userName,
                        keyboardType: TextInputType.text,
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: 'Username',
                          icon: Icon(Icons.person_add),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              _userName.clear();
                            },
                          ),
                        ),
                      ),
                      new TextFormField(
                        controller: _userName,
                        keyboardType: TextInputType.emailAddress,
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: 'email@something.com',
                          icon: Icon(Icons.mail),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              _userName.clear();
                            },
                          ),
                        ),
                      ),
                      new TextFormField(
                        controller: _userName,
                        autofocus: true,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          icon: Icon(
                            Icons.lock,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              _userName.clear();
                            },
                          ),
                        ),
                      ),
                    ],
                  ))),
          padding: EdgeInsets.all(12.0),
        ));
  }
}
