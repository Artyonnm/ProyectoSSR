import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AgregarProducto extends StatefulWidget {
  @override
  _AgregarProductoState createState() => _AgregarProductoState();
}

class _AgregarProductoState extends State<AgregarProducto> {
  TextEditingController controllerDescripcion = TextEditingController();
  TextEditingController controllerTamano = TextEditingController();
  TextEditingController controllerCantidad = TextEditingController();

  var _formKey = GlobalKey<FormState>();

  void addData2() {
    var url = Uri.parse("http://192.168.1.2/tienda/adddata.php");

    http.post(url, body: {
      "type": "productos",
      "descripcion": controllerDescripcion.text,
      "tamano": controllerTamano.text,
      "cantidad": controllerCantidad.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Agregar Productos',
                    style: TextStyle(
                      fontFamily: 'cursive',
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              const Text(
                'Descripción',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: TextFormField(
                  style: const TextStyle(fontSize: 16),
                  controller: controllerDescripcion,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingresa una descripción';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Descripción del Producto',
                    labelStyle: TextStyle(fontSize: 16),
                    border: InputBorder.none,
                  ),
                  minLines: 1,
                  maxLines: 2,
                  onSaved: (value) {
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tamaño',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 100,
                          child: TextFormField(
                            style: TextStyle(fontSize: 16),
                            controller: controllerTamano,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Por favor, ingresa el tamaño';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Tamaño',
                              labelStyle: TextStyle(fontSize: 16),
                            ),
                            onSaved: (value) {
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Cantidad',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 100,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 16),
                            controller: controllerCantidad,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Por favor, ingresa la cantidad';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Cantidad',
                              labelStyle: TextStyle(fontSize: 16),
                            ),
                            onSaved: (value) {
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        addData2();
                        Navigator.pop(context);
                      }
                    },
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
