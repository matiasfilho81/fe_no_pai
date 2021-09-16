import 'package:flutter/material.dart';

import 'pages/home.dart';
// import 'login.dart';

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
      home: Home(title: 'Fé no Pai'), //MyLogin(title: 'Fé no Pai'),
    );
  }
}
