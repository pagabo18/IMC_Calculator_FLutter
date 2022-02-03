import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pressedM = 0, _pressedF = 1;
  final controller_peso = TextEditingController();
  final controller_altura = TextEditingController();

  String PesoM() {
    return (double.parse(controller_peso.text) /
            ((double.parse(controller_altura.text)) *
                (double.parse(controller_altura.text))))
        .toStringAsFixed(2);
  }

  void _showcontentWMN() {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Tu IMC ' + PesoM()),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: [
                new Text('Tabla del IMC para mujeres'),
                Expanded(child: Divider()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(children: [
                      new Text('edad', style: TextStyle(fontSize: 15)),
                      new Text('16-17', style: TextStyle(fontSize: 15)),
                      new Text('18-19', style: TextStyle(fontSize: 15)),
                      new Text('19-24', style: TextStyle(fontSize: 15)),
                      new Text('25-34', style: TextStyle(fontSize: 15)),
                      new Text('35-44', style: TextStyle(fontSize: 15)),
                      new Text('45-54', style: TextStyle(fontSize: 15)),
                      new Text('55-64', style: TextStyle(fontSize: 15)),
                      new Text('65-90', style: TextStyle(fontSize: 15)),
                    ]),
                    Column(children: [
                      new Text('IMC ideal', style: TextStyle(fontSize: 15)),
                      new Text('19-24', style: TextStyle(fontSize: 15)),
                      new Text('19-24', style: TextStyle(fontSize: 15)),
                      new Text('19-24', style: TextStyle(fontSize: 15)),
                      new Text('20-25', style: TextStyle(fontSize: 15)),
                      new Text('21-26', style: TextStyle(fontSize: 15)),
                      new Text('22-27', style: TextStyle(fontSize: 15)),
                      new Text('23-28', style: TextStyle(fontSize: 15)),
                      new Text('25-30', style: TextStyle(fontSize: 15)),
                    ])
                  ],
                )
              ],
            ),
          ),
          actions: [
            new TextButton(
              child: new Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showcontentMN() {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Tu IMC:' + PesoM()),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: [
                new Text('Tabla del IMC para Hombres'),
                Expanded(child: Divider()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(children: [
                      new Text('edad', style: TextStyle(fontSize: 15)),
                      new Text('16-17', style: TextStyle(fontSize: 15)),
                      new Text('18-19', style: TextStyle(fontSize: 15)),
                      new Text('19-24', style: TextStyle(fontSize: 15)),
                      new Text('25-34', style: TextStyle(fontSize: 15)),
                      new Text('35-44', style: TextStyle(fontSize: 15)),
                      new Text('45-54', style: TextStyle(fontSize: 15)),
                      new Text('55-64', style: TextStyle(fontSize: 15)),
                      new Text('65-90', style: TextStyle(fontSize: 15)),
                    ]),
                    Column(children: [
                      new Text('IMC ideal', style: TextStyle(fontSize: 15)),
                      new Text('21-25', style: TextStyle(fontSize: 15)),
                      new Text('21-25', style: TextStyle(fontSize: 15)),
                      new Text('21-25', style: TextStyle(fontSize: 15)),
                      new Text('26-30', style: TextStyle(fontSize: 15)),
                      new Text('26-30', style: TextStyle(fontSize: 15)),
                      new Text('31-32', style: TextStyle(fontSize: 15)),
                      new Text('32-34', style: TextStyle(fontSize: 15)),
                      new Text('32-34', style: TextStyle(fontSize: 15)),
                    ])
                  ],
                )
              ],
            ),
          ),
          actions: [
            new FlatButton(
              child: new Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //Scaffold indica que se formara una pantalla
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {},
          ),
        ],
        title: Text('Calcular IMC'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          SizedBox(height: 14),
          Column(
            children: [
              Text("Ingrese sus datos para calcular el IMC"),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                IconButton(
                    onPressed: () {
                      if (_pressedF == 0) {
                        setState(() {
                          _pressedF = 1;
                          _pressedM = 0;
                        });
                      }
                    },
                    icon: Icon(Icons.female),
                    color: (_pressedF == 0) ? Colors.grey : Colors.green),
                IconButton(
                    onPressed: () {
                      if (_pressedM == 0) {
                        setState(() {
                          _pressedF = 0;
                          _pressedM = 1;
                        });
                      }
                    },
                    icon: Icon(Icons.male),
                    color: (_pressedM == 0) ? Colors.grey : Colors.green),
              ]),
            ],
          ),
          ListTile(
            leading: Icon(Icons.square_foot),
            title: Padding(
              padding: EdgeInsets.only(right: 24),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("Ingresar Altura(metros)"),
                  border: OutlineInputBorder(),
                ),
                controller: controller_altura,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.add_box),
            title: Padding(
              padding: EdgeInsets.only(right: 24),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("Ingresar Peso(kg)"),
                  border: OutlineInputBorder(),
                ),
                controller: controller_peso,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: MaterialButton(
                    child: Text("Calcular"),
                    onPressed:
                        (_pressedF == 0) ? _showcontentWMN : _showcontentMN,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
