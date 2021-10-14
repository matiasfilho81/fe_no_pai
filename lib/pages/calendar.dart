import 'package:fe_no_pai/utils/common.dart';
import 'package:fe_no_pai/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalendarPage extends StatefulWidget {
  static String tag = '/calendar';
  const CalendarPage({Key key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final TextEditingController _nameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AppConsts.setWidhtSize(MediaQuery.of(context).size.width);
    AppConsts.setHeightSize(MediaQuery.of(context).size.height);
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
      ),
      body: corpo(),
    );
  }

  Widget corpo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: setWidth(24), vertical: setHeight(24)),
      color: AppConsts.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: setHeight(50)),
          _formulario(),
          _botoes(),
        ],
      ),
    );
  }

  Widget _formulario() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelGenerico("nome"),
        _nameContainer(),
        // labelGenerico("e-mail"),
        // labelGenerico("telefone"),
        // labelGenerico("data de nascimento"),
      ],
    );
  }

  Widget _botoes() {
    return Column(
      children: [
        botao(texto: "Salvar", action: () => print("hora de salvar!")),
        // botao(texto: "Enviar", action: () => print("hora de enviar!")),
      ],
    );
  }

  Widget _nameContainer() {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      textInputAction: TextInputAction.next,
      controller: _nameCtrl,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z.âãáÃÂÁõôóÕÔÓêÊéÉíÍúÚÇç&\ ]")),
      ],
      validator: (value) {
        if (value.isEmpty) {
          return 'Precisamos de um nome para a conta.';
        } else if (value.length < 5) {
          return 'Precisamos de no mínimo 5 caracteres.';
        }
        return null;
      },
      // onChanged: (value) {
      //   print(_nameCtrl.text);
      // },
    );
  }
}
