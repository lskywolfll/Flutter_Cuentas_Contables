import 'package:cuentas_contables/src/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:cuentas_contables/src/pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => LoginPage(),
    '/home': (BuildContext context) => InputPage()
  };
}
