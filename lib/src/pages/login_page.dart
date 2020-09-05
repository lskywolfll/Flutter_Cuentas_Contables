import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = "";
  String _password = "";
  String _api = "http://3.17.182.71:49165";
  bool logeando = false;

  @override
  void initState() async {
    // TODO: implement initState
    super.initState();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.get('token');
    if (token != null) {
      Navigator.of(context).pushNamed('/home');
    }
  }

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
            _buttonLogin(context)
          ],
        ),
      ),
    );
  }

  Future<Map> _Logearse(BuildContext context) async {
    http.Response response = await http
        .post(_api + "/Login", body: {'email': _email, 'password': _password});

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    Map<String, dynamic> data = convert.jsonDecode(response.body);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.get('token');

    if (token == null) {
      await prefs.setString('token', data['token']);
      Navigator.of(context).pushNamed('/home');
    } else {
      Navigator.of(context).pushNamed('/home');
    }
  }

  void _mostrarAlert(BuildContext context, token) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Login'),
          content: Column(
            children: <Widget>[Text('Este es tu token $token')],
          ),
        );
      },
    );
  }

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

  Widget _buttonLogin(BuildContext context) {
    return FlatButton(
      onPressed: () {
        _Logearse(context);
      },
      color: Colors.blueAccent,
      child: Text('Logearse'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    );
  }
}
