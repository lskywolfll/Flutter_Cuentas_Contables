import 'package:cuentas_contables/src/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('en', 'US'), const Locale('es', 'ES')],
      title: 'Componentes App',
      // home: HomePage(),
      initialRoute: '/',
      routes: getApplicationRoutes(),
    );
  }
}
