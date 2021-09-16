import 'package:fe_no_pai/utils/common.dart';
import 'package:fe_no_pai/utils/consts.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    AppConsts.setWidhtSize(MediaQuery.of(context).size.width);
    AppConsts.setHeightSize(MediaQuery.of(context).size.height);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // robo(),
          bandeiraBelgica()
        ],
      ),
    );
  }
}

Widget bandeiraBelgica() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      faixa(cor: AppConsts.blackBasic2),
      faixa(cor: AppConsts.yellowBasic2),
      faixa(cor: AppConsts.redBasic2),
    ],
  );
}

Widget faixa({Color cor}) {
  final double h = setWidth(200.0);
  final double l = setHeight(100.0);
  return Container(
    height: h,
    width: l,
    color: cor,
  );
}
