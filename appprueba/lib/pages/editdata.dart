import 'package:appprueba/pages/Stock.dart';
import 'package:appprueba/pallete.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({required this.list, required this.index});
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController controllerDescripcion;
  late TextEditingController controllerTamano;
  late TextEditingController controllerCantidad;

  void editData() {
    var url = Uri.parse("http://192.168.1.2/tienda/editdata.php");
    http.post(url, body: {
      "type": "productos",
      "descripcion": controllerDescripcion.text,
      "tamano": controllerTamano.text,
      "cantidad": controllerCantidad.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    controllerDescripcion =
        TextEditingController(text: widget.list[widget.index]['descripcion']);
    controllerCantidad =
        TextEditingController(text: widget.list[widget.index]['cantidad']);
    controllerTamano =
        TextEditingController(text: widget.list[widget.index]['tamano']);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.backgroundColor,
        title: const Text("Editar Producto"),
        titleTextStyle: const TextStyle(
          fontFamily: 'cursive',
          fontSize: 30,
          color: Colors.white,
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                ListTile(
                  leading: const Icon(
                    Icons.description,
                    color: Colors.black,
                  ),
                  title: TextFormField(
                    controller: controllerDescripcion,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Ingresa una descripción";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Descripción",
                      labelText: "Descripción",
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.widgets,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  title: TextFormField(
                    controller: controllerCantidad,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Ingresa una cantidad";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Tamaño",
                      labelText: "Tamaño",
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.widgets,
                    color: Colors.black,
                  ),
                  title: TextFormField(
                      controller: controllerTamano,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Ingresa una tamaño";
                        }
                        return null;
                      }),
                ),
                const Divider(
                  height: 1.0,
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                ElevatedButton(
                    child: const Text("Guardar"),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 3, 182, 158),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        editData();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => StockProductos(),
                          ),
                        );
                      }
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
