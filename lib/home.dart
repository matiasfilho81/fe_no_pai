import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            robo(),
            robo(),
            robo(),
            robo(),
            robo(),
            robo(),
            robo(),
            robo(),
            robo(),
            robo(),
            robo(),
            robo(),
            robo(),
            robo(),
            robo(),
          ],
        ),
      ),
    );
  }
}

Widget robo() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      cabeca(),
      corpo(),
      pernas(),
    ],
  );
}

Widget cabeca() {
  return Container(
    color: Colors.yellow,
    width: 50.0,
    height: 50.0,
  );
}

Widget corpo() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        color: Colors.purple,
        width: 50.0,
        height: 50.0,
      ),
      Container(
        color: Colors.indigo,
        width: 100,
        height: 100,
        child: Center(
          child: Container(
            color: Colors.white,
            width: 50,
            height: 50,
            child: Center(child: Text("Robo")),
          ),
        ),
      ),
      Container(
        color: Colors.purple,
        width: 50.0,
        height: 50.0,
      ),

      // Text(
      //   'You have pushed the button this many times:',
      // ),
      // Text(
      //   '$_counter',
      //   style: Theme.of(context).textTheme.headline4,
      // ),
    ],
  );
}

Widget pernas() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        color: Colors.pink,
        width: 50.0,
        height: 50.0,
      ),
      SizedBox(
        width: 20,
      ),
      Container(
        color: Colors.green,
        width: 50.0,
        height: 50.0,
      ),
    ],
  );
}
