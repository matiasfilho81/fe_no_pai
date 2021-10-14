import 'package:fe_no_pai/pages/calendar.dart';
import 'package:fe_no_pai/pages/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/calendar',
      routes: {
        '/login': (context) => LoginPage(),
        '/calendar': (context) => CalendarPage(),
        // LoginPage.tag: (context) => LoginPage(),
      },
    );
  }
}
