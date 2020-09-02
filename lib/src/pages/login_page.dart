import 'package:flutter/material.dart';
import 'dart:async';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: 60),
                Image.asset('assets/Login.png'),
                Text(
                  'Login',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                )
              ],
            ),
            SizedBox(height: 30.0),
            _inputEmail(),
            SizedBox(height: 30.0),
            _inputPassword(),
            SizedBox(height: 15.0),
            _buttonLogin()
          ],
        ),
      ),
    );
  }

  Future<Map> _Logearse() {}

  Widget _inputEmail() {
    return TextField(
      autocorrect: true,
      keyboardType: TextInputType.emailAddress,
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      },
      decoration: InputDecoration(
          labelText: 'Correo',
          icon: Icon(Icons.email),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
    );
  }

  Widget _inputPassword() {
    return TextField(
      autocorrect: false,
      obscureText: true,
      keyboardType: TextInputType.text,
      onChanged: (valor) {
        setState(() {
          _password = valor;
        });
      },
      decoration: InputDecoration(
          labelText: 'Contraseña',
          icon: Icon(Icons.lock),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
    );
  }

  Widget _buttonLogin() {
    return FlatButton(
      onPressed: () {},
      color: Colors.blueAccent,
      child: Text('Logearse'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    );
  }
}
