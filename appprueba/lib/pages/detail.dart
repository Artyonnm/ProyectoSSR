import 'package:appprueba/pages/Stock.dart';
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
      content: const Text(
        "¿Estás seguro que quieres eliminar esto?",
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Lora',
        ),
      ),
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
            "Sí, eliminar",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Lora',
            ),
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
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Lora',
            ),
          ),
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) => alertDialog,
    );
  }

  void addToCart() {
    // Agrega aquí la lógica para agregar el producto al carrito de compras.
    // Puedes mostrar un mensaje de confirmación o realizar alguna acción adicional.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.backgroundColor,
        title: const Text("Producto"),
        titleTextStyle: const TextStyle(
          fontFamily: 'Lora',
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      body: Container(
        height: 200.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 2, 32, 56),
                  Color.fromARGB(255, 20, 133, 181)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  Text(
                    widget.list[widget.index]['descripcion'],
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Lora',
                    ),
                  ),
                  const Divider(),
                  Text(
                    "Tamaño : ${widget.list[widget.index]['tamano']}",
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Lora',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(left: 0.0, right: 10.0),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(233, 255, 2, 2),
                          ),
                        ),
                        onPressed: () => confirmar(),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Eliminar",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Lora',
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(233, 51, 187, 51),
                          ),
                        ),
                        onPressed: () => addToCart(),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            ),
                            SizedBox(width: 6),
                            Text(
                              "Carrito ",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Lora',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
