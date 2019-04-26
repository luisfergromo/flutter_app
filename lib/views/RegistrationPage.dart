import 'package:flutter/material.dart';
import 'package:my_app/controllers/input_validation.dart';

//final TextEditingController _textController = new TextEditingController();
final TextEditingController _emailController = new TextEditingController();
final TextEditingController _passwordController = new TextEditingController();
final TextEditingController _usernameController = new TextEditingController();

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String _email;
String _password;
String _username;
bool _autoValidate = false;

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Registro'),
        ),
        body: new SingleChildScrollView(
          child: Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
                key: _formKey, autovalidate: _autoValidate, child: formUI()),
          ),
          padding: EdgeInsets.all(12.0),
        ));
  }
}

Widget formUI() {
  return new Theme(
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
            controller: _usernameController,
            keyboardType: TextInputType.text,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Username',
              icon: Icon(Icons.person_add),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  _usernameController.clear();
                },
              ),
            ),
            validator: validateUsername,
            onSaved: (String val) {
              _username = val;
            },
          ),
          new TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'email@something.com',
              icon: Icon(Icons.mail),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  _emailController.clear();
                },
              ),
            ),
            validator: validateEmail,
            autocorrect: true,
            onSaved: (String val) {
              _email = val;
            },
          ),
          new TextFormField(
            //controller: ,
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
                  _passwordController.clear();
                },
              ),
            ),
            validator: validatePassword,
            onSaved: (String val) {
              _password = val;
            },
          ),
          RaisedButton(
              onPressed: () {
                _performRegistration();
              },
              child: Text('Registrar')),
        ],
      ));
}

void _performRegistration() {
  if (_formKey.currentState.validate()) {
    _formKey.currentState.save();
    debugPrint('Username: $_username\t|Email: $_email\t|Pass: $_password');

    // print(_formKey.currentState.toString());
  } else {
    _autoValidate = true;
  }
}
