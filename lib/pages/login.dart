import 'package:fe_no_pai/pages/calendar.dart';
import 'package:fe_no_pai/utils/common.dart';
import 'package:fe_no_pai/utils/consts.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static String tag = '/';
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    AppConsts.setWidhtSize(MediaQuery.of(context).size.width);
    AppConsts.setHeightSize(MediaQuery.of(context).size.height);
    return Scaffold(body: corpo());
  }

  Widget corpo() {
    return Container(
      color: AppConsts.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset('lib/images/logo-usf.png', width: setWidth(100))),
          Container(
            width: setWidth(200.0),
            child: botao(
                texto: "enter",
                action: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => CalendarPage(title: "Schedule"),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
