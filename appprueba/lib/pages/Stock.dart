import 'package:appprueba/pages/Inicio.dart';
import 'package:appprueba/pages/detail.dart';
import 'package:appprueba/pallete.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

class StockProductos extends StatefulWidget {
  const StockProductos({Key? key}) : super(key: key);

  @override
  _StockProductosState createState() => _StockProductosState();
}

class _StockProductosState extends State<StockProductos> {
  List<dynamic> data = [];

  get i => null;

  get list => null;

  Future<List<dynamic>> getData() async {
    var url = Uri.parse("http://192.168.1.2/tienda/getdata_productos.php");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> responseData = json.decode(response.body);
      return responseData;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.backgroundColor,
        title: const Text("Stock de productos"),
        titleTextStyle: const TextStyle(
          fontFamily: 'Lora',
          fontSize: 20,
          color: Colors.white,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const InicioInv(
                        username: '',
                      )),
            );
          },
        ),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return const Center(child: Text("Error al cargar datos"));
          }
          data = snapshot.data ?? [];
          return snapshot.hasData
              ? ItemList(
                  list: data,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, i) {
        return Container(
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => Detail(
                  list: list,
                  index: i,
                ),
              ),
            ),
            child: Card(
              color: Pallete.backgroundColor,
              child: Title(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          list[i]['descripcion'],
                          style: const TextStyle(
                            fontFamily: 'Lora',
                            fontSize: 25.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/tarro.png',
                            width: 38.0,
                            height: 38.0,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Tamaño: ${list[i]['tamano']}",
                            style: const TextStyle(
                              fontFamily: 'Lora',
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Cantidad: ${list[i]['cantidad']}",
                            style: const TextStyle(
                              fontFamily: 'Lora',
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Precio: \$${list[i]['precio']}",
                            style: const TextStyle(
                              fontFamily: 'Lora',
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
        );
      },
    );
  }
}
