import 'package:flutter/material.dart';
import 'package:my_app/controllers/home_widget.dart';
import 'RegistrationPage.dart';

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

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
//     resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.grey,
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        new Image(
          image: AssetImage('assets/girls.jpeg'),
          fit: BoxFit.cover,
          color: Colors.black87,
          colorBlendMode: BlendMode.darken,
        ),
        new Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          new FlutterLogo(
            size: _iconAnimation.value * 100,
          ),
          new Form(
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
                                  labelText: 'Email:',
                                  hintText: 'email@something.com'),
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailController,
                              autovalidate: true,
                            ),
                            new TextFormField(
                              decoration:
                                  new InputDecoration(labelText: 'Password:'),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              controller: _passwordController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'There\'s no password';
                                }
                              },
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: SizedBox(
                                    width: double.infinity,
                                    child: new RaisedButton(
                                        child: Text('LOGIN'),
                                        splashColor: Colors.greenAccent,
                                        onPressed: () {
                                          _performLogin();
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
                                  },
                                  child: Text('No account yet? Create one')),
                            ),
                          ])))),
        ]),
      ]),
    );
  }

  void _performLogin() {
    String email = _emailController.text;
    String password = _passwordController.text;
    print('login attempt: $email with $password');

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));
  }
}
