// arquivo common do projeto

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'consts.dart';

double setWidth(double value) {
  return value * AppConsts.widthPercentage;
}

double setHeight(double value) {
  return value * AppConsts.heightPercentage;
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

Widget botao({String texto, Function action, double maxWidth = 344, bool disabled = false}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: setHeight(5.0)),
    child: Container(
      height: setHeight(40),
      child: RaisedButton(
        onPressed: () => disabled ? Container() : action(),
        padding: EdgeInsets.symmetric(horizontal: setHeight(5.0)),
        color: AppConsts.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(AppConsts.radiusBotton),
            topLeft: Radius.circular(AppConsts.radiusBotton),
            bottomRight: Radius.circular(AppConsts.radiusBotton),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              texto.toUpperCase(),
              style: TextStyle(
                color: disabled ? AppConsts.offText : AppConsts.onText,
                fontSize: AppConsts.fontSize16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget labelGenerico(String string, {Color textColor}) {
  TextStyle textStyle =
      ((textColor == null) ? AppConsts.textLabel : AppConsts.textLabel.copyWith(color: textColor));
  return Padding(
    padding: EdgeInsets.only(top: setHeight(16)),
    child: Text(
      string.toUpperCase(),
      style: textStyle,
    ),
  );
}

String formatDateToLocale(DateTime value) {
  if (value != null) {
    return DateFormat.yMMMMd("pt_BR").format(value);
  } else {
    return " - ";
  }
}

Widget quatro(Widget image) {
  return Container(
    decoration: BoxDecoration(
      color: AppConsts.fundoTextFormField,
      borderRadius: BorderRadius.circular(AppConsts.radiusBotton),
    ),
    child: image,
  );
}
