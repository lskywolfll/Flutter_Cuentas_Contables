import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _descripcion = '';
  String _precio = '';
  String _opcionSeleccionada = "Pasivo";

  List<String> _poderes = [
    'Salud',
    'Educacion',
    'Inversion',
    'Pasivo',
    'No Potenciador'
  ];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gastos'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearTitulo(),
          Divider(),
          _crearDescripcion(),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPrecio(),
          Divider(),
          _btnSubmit()
        ],
      ),
    );
  }

  Widget _btnSubmit() {
    return Center(
      child: FlatButton.icon(
          onPressed: () {},
          color: Colors.blue,
          icon: Icon(Icons.account_balance_wallet),
          label: Text('SUBIR')),
    );
  }

  Widget _crearDescripcion() {
    return TextField(
      autocorrect: true,
      maxLines: 4,
      decoration: InputDecoration(
          hintText: 'Descripcion de por que estas gastando el dinero',
          labelText: 'Descripcion',
          helperText: 'Recuerda hacer descripciones apropiadas',
          icon: Icon(Icons.assignment),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      cursorColor: Colors.blue[300],
      maxLength: 165,
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.text,
    );
  }

  Widget _crearPrecio() {
    return TextField(
      autocorrect: true,
      decoration: InputDecoration(
          hintText: 'Ingresa el precio',
          labelText: 'Precio',
          helperText: 'Recuerda poner el total del costo',
          icon: Icon(Icons.attach_money),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      keyboardType: TextInputType.number,
    );
  }

  Widget _crearTitulo() {
    return TextField(
      autocorrect: true,
      // autofocus: true,
      decoration: InputDecoration(
          hintText: 'Ingresa la razon de este gasto',
          labelText: 'Razón',
          helperText: 'Sólo es la razón',
          suffixIcon: Icon(Icons.assignment_late),
          icon: Icon(Icons.announcement),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
      cursorColor: Colors.pink,
      maxLength: 13,
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.text,
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach((element) {
      lista.add(DropdownMenuItem(
        value: element,
        child: Text(element),
      ));
    });

    return lista;
  }

  Widget _crearDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(
          width: 30.0,
        ),
        DropdownButton(
          value: _opcionSeleccionada,
          items: getOpcionesDropdown(),
          onChanged: (value) {
            setState(() {
              _opcionSeleccionada = value;
            });
          },
        )
      ],
    );
  }
}
