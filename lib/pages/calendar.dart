import 'package:fe_no_pai/pages/login.dart';
import 'package:fe_no_pai/utils/common.dart';
import 'package:fe_no_pai/utils/consts.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  final String nome;
  static String tag = '/calendar';
  const CalendarPage({this.nome, Key key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    AppConsts.setWidhtSize(MediaQuery.of(context).size.width);
    AppConsts.setHeightSize(MediaQuery.of(context).size.height);
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendário Médico"),
      ),
      body: corpo(),
    );
  }

  Widget corpo() {
    return Container(
      color: AppConsts.backgroundColor,
      child: Center(
        child: Container(
          color: AppConsts.offBottom,
          width: setWidth(200.0),
          height: setHeight(80.0),
          child: OutlinedButton.icon(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("/login");
              },
              icon: Icon(Icons.logout, size: setHeight(18.0)),
              label: Text(widget.nome)),
        ),
      ),
    );
  }
}
