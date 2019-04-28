import 'package:flutter/material.dart';
import 'package:my_app/controllers/home_widget.dart';
// import 'RegistrationPage.dart';
import 'package:my_app/controllers/input_validation.dart';
import 'package:my_app/views/RegistrationPage.dart';

final _formKey = GlobalKey<FormState>();
final _checkKey = GlobalKey<State>();
final _usernameController = TextEditingController();
final _passwordController = TextEditingController();

String _password;
String _username;
bool _autoValidate = false;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeOut);

    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return loginPage();
  }

  bool initialState = false;

  Widget loginPage() {
    return Scaffold(
      // appBar: AppBar(),
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.grey,
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        new Image(
          image: AssetImage('assets/girls.jpeg'),
          fit: BoxFit.cover,
          color: Colors.black87,
          colorBlendMode: BlendMode.darken,
        ),
        new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              new Form(
                  autovalidate: _autoValidate,
                  key: _formKey,
                  child: new Theme(
                      data: new ThemeData(
                          brightness: Brightness.dark,
                          primarySwatch: Colors.teal,
                          inputDecorationTheme: new InputDecorationTheme(
                              labelStyle: new TextStyle(
                                  color: Colors.teal, fontSize: 20.0))),
                      child: Container(
                          padding: const EdgeInsets.all(40.0),
                          child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                new TextFormField(
                                    decoration: new InputDecoration(
                                      labelText: 'Nombre de usuario:',
                                      // hintText: 'email@something.com'
                                    ),
                                    keyboardType: TextInputType.text,
                                    controller: _usernameController,
                                    validator: validateUsername,
                                    onSaved: (String val) {
                                      _username = val;
                                    }),
                                new TextFormField(
                                  decoration: new InputDecoration(
                                      labelText: 'Contraseña:'),
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  controller: _passwordController,
                                  validator: validatePassword,
                                  onSaved: (String val) {
                                    _password = val;
                                  },
                                ),
                                new Container(
                                  constraints: BoxConstraints(),
                                  child: new Row(
                                    children: <Widget>[
                                      Text(
                                        'Mantener datos de sesión',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Checkbox(
                                          activeColor: Colors.teal,
                                          key: _checkKey,
                                          onChanged: (bool value) {
                                            setState(() {
                                              initialState = value;
                                            });
                                          },
                                          value: initialState),
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: SizedBox(
                                        width: double.infinity,
                                        child: new RaisedButton(
                                            child: Text('Ingresar'),
                                            splashColor: Colors.greenAccent,
                                            onPressed: () {
                                              _performLogin(context);
                                            }))),
                                Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: FlatButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RegistrationPage()));
                                        // Navigator.popAndPushNamed(
                                        //     context, '/registration');
                                      },
                                      child: Text(
                                        '¿Aún no tienes cuenta?\n¡Crea una ahora!',
                                        style: TextStyle(inherit: true),
                                      )),
                                ),
                              ])))),
            ]),
      ]),
    );
  }

  void _performLogin(context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      debugPrint('Username: $_username\t|Pass: $_password');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    } else {
      _autoValidate = true;
    }
  }
}
