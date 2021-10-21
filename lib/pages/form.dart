import 'package:fe_no_pai/utils/common.dart';
import 'package:fe_no_pai/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/date_symbol_data_local.dart';

class FormPage extends StatefulWidget {
  static String tag = '/calendar';
  const FormPage({Key key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController _nameCtrl = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DateTime _birthDate;

  @override
  void initState() {
    initializeDateFormatting();
    _birthDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppConsts.setWidhtSize(MediaQuery.of(context).size.width);
    AppConsts.setHeightSize(MediaQuery.of(context).size.height);
    return Scaffold(
      appBar: AppBar(
        title: Text("Insert Event"),
        backgroundColor: AppConsts.backgroundColor,
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
          _formulario(),
          _botoes(),
        ],
      ),
    );
  }

  Widget _formulario() {
    return _embrulha(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelGenerico("Descrição"),
          quatro(_nameContainer()),
          labelGenerico("Data"),
          quatro(_dateContainer()),
        ],
      ),
    );
  }

  Widget _embrulha(Widget _corpo) {
    return Form(
      key: _formKey,
      child: Flexible(
        child: SingleChildScrollView(
          child: Container(
            child: _corpo,
          ),
        ),
      ),
    );
  }

  Widget _botoes() {
    return Column(
      children: [
        botao(texto: "Salvar", action: () => print("hora de salvar!")),
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
    );
  }

  Widget _dateContainer() {
    return GestureDetector(
      child: Container(
        height: setHeight(40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(formatDateToLocale(_birthDate)),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
      onTap: () {
        DatePicker.showDatePicker(
          context,
          locale: LocaleType.pt,
          currentTime: _birthDate,
          onConfirm: (date) {
            setState(() {
              _birthDate = date;
            });
          },
        );
      },
    );
  }
}
