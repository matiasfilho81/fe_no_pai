import 'package:fe_no_pai/utils/common.dart';
import 'package:fe_no_pai/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:search_choices/search_choices.dart';

class CalendarPage extends StatefulWidget {
  static String tag = '/calendar';
  const CalendarPage({Key key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _sexoCtrl = TextEditingController();
  final MaskedTextController _telemovelCtrl = MaskedTextController(mask: '(00) 00000-0000');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DateTime _birthDate;
  List _sexoList;

  @override
  void initState() {
    _sexoList = Sexo.map.entries.map((e) => Sexo(e.key, e.value)).toList();
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
          labelGenerico("nome"),
          quatro(_nameContainer()),
          labelGenerico("sexo"),
          quatro(_choiceSexoList()),
          labelGenerico("telefone"),
          quatro(_telefoneContainer()),
          labelGenerico("data de nascimento"),
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
        // botao(texto: "Enviar", action: () => print("hora de enviar!")),
      ],
    );
  }

  Widget _choiceSexoList() {
    return SearchChoices.single(
      dialogBox: true,
      displayClearIcon: false,
      closeButton: null,
      isExpanded: true,
      underline: Container(
        height: 1,
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: setWidth(14)),
      ),
      items: _sexoList.map<DropdownMenuItem<String>>((item) {
        return DropdownMenuItem<String>(
          value: item.code + ' - ' + item.description,
          child: Text(item.description),
        );
      }).toList(),
      onChanged: (String value) {
        setState(() {
          _sexoCtrl.text = value;
        });
      },
      searchHint: "Informe um motivo",
      value: _sexoCtrl.text,
    );
  }

  Widget _telefoneContainer() {
    return TextFormField(
      controller: _telemovelCtrl,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
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

  Widget _dateContainer() {
    // DateTime max = DateTime.now().subtract(Duration(days: 365 * 18));
    return GestureDetector(
      child: Container(
        height: setHeight(40),
        decoration: BoxDecoration(
            // border: AppConsts.borda,
            ),
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
          // minTime: DateTime.now().subtract(Duration(days: 365 * 140)),
          // maxTime: max,
          locale: LocaleType.pt,
          currentTime: _birthDate,
          onConfirm: (date) {
            setState(() {
              _birthDate = date;
            });
          },
          theme: DatePickerTheme(
              // cancelStyle: TextStyle(color: AppConsts.textSecondary),
              // doneStyle: TextStyle(color: AppConsts.textSecondary),
              ),
        );
      },
    );
  }
}

class Sexo {
  String code;
  String description;
  Sexo(this.code, this.description);

  static Map<String, String> map = {
    'male': 'Masculino',
    'female': 'Fêmea',
    'other': 'Ignorado',
  };
}
