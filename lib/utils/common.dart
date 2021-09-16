// arquivo common do projeto

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'consts.dart';

double setWidth(double value) {
  return value * AppConsts.widthPercentage;
}

double setHeight(double value) {
  return value * AppConsts.heightPercentage;
}

// colocar depois do  Widget build(BuildContext context)

// AppConsts.setWidhtSize(MediaQuery.of(context).size.width);
// AppConsts.setHeightSize(MediaQuery.of(context).size.height);

Widget botao(
    {String texto,
    String pathImage,
    Function action,
    double maxWidth = 344,
    bool disabled = false}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: setHeight(5.0)),
    child: Container(
      height: setHeight(40),
      child: RaisedButton(
        onPressed: () => disabled ? Container() : action(),
        padding: EdgeInsets.symmetric(horizontal: setHeight(5.0)),
        color: AppConsts.backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConsts.radiusBotton)),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppConsts.backgroundColor,
              maxRadius: setHeight(16),
              child: Image.asset(
                pathImage,
                height: setHeight(18),
                color: AppConsts.backgroundColor,
              ),
            ),
            SizedBox(width: setWidth(10.0)),
            Container(
              constraints: BoxConstraints(maxWidth: setWidth(maxWidth - 10 - 32 - 10)),
              child: Text(
                texto.toUpperCase(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: disabled ? AppConsts.offText : AppConsts.onText,
                  fontSize: AppConsts.fontSize10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
