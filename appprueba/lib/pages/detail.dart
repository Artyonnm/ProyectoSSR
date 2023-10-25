import 'package:appprueba/pages/Stock.dart';
import 'package:appprueba/pages/editdata.dart';
import 'package:appprueba/pallete.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Detail extends StatefulWidget {
  final List list;
  final int index;
  const Detail({super.key, required this.index, required this.list});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  void deleteData() {
    var url = Uri.parse("http://192.168.1.2/tienda/deleteData.php");
    http.post(url, body: {
      "type": "productos",
      'id': widget.list[widget.index]['id'],
    });
  }

  void confirmar() {
    AlertDialog alertDialog = AlertDialog(
      content: const Text("¿Estas seguro que quieres eliminar esto?"),
      actions: <Widget>[
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 6, 165, 168),
            ),
          ),
          onPressed: () {
            deleteData();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => const StockProductos(),
              ),
            );
          },
          child: const Text(
            "Si, eliminar",
            style: TextStyle(color: Colors.white),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.red,
            ),
          ),
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "Cancelar",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) => alertDialog,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.backgroundColor,
        title: const Text("Producto"),
        titleTextStyle: const TextStyle(
          fontFamily: 'cursive',
          fontSize: 30,
          color: Colors.white,
        ),
      ),
      body: Container(
        height: 270.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 30.0),
                ),
                Text(
                  widget.list[widget.index]['descripcion'],
                  style: const TextStyle(fontSize: 20.0),
                ),
                const Divider(),
                Text(
                  "tamano : ${widget.list[widget.index]['tamano']}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30.0),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.green,
                        ),
                      ),
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => EditData(
                            list: widget.list,
                            index: widget.index,
                          ),
                        ),
                      ),
                      child: const Text(
                        "Editar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(233, 255, 2, 2),
                        ),
                      ),
                      onPressed: () => confirmar(),
                      child: const Text(
                        "Eliminar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}