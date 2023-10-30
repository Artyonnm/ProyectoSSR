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
  TextEditingController controllerPrecio = TextEditingController();

  var _formKey = GlobalKey<FormState>();
  List<String> productosIngresados = [];
  List<String> cantidadIngresada = [];

  void addData2() {
    // Verifica si el producto ya existe en la lista local
    if (productosIngresados.contains(controllerDescripcion.text) &&
        cantidadIngresada[
                productosIngresados.indexOf(controllerDescripcion.text)] ==
            controllerCantidad.text) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text(
                'Este producto ya existe con la misma descripción y cantidad.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cerrar'),
              ),
            ],
          );
        },
      );
    } else {
      var url = Uri.parse("http://127.0.0.1/tienda/adddata.php");

      http.post(url, body: {
        "type": "productos",
        "descripcion": controllerDescripcion.text,
        "tamano": controllerTamano.text,
        "cantidad": controllerCantidad.text,
        "precio": controllerPrecio.text,
      });

      setState(() {
        productosIngresados.add(controllerDescripcion.text);
        cantidadIngresada.add(controllerCantidad.text);
      });
    }
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
              const SizedBox(height: 20),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Agregar Productos',
                    style: TextStyle(
                      fontFamily: 'Lora',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Descripción',
                style: TextStyle(
                  fontFamily: 'Lora',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
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
                    labelStyle: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Lora',
                    ),
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
                            fontFamily: 'Lora',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          width: 100,
                          child: TextFormField(
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Lora',
                            ),
                            controller: controllerTamano,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Por favor, ingresa el tamaño';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Tamaño',
                              labelStyle: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Lora',
                              ),
                            ),
                            onSaved: (value) {
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Cantidad',
                          style: TextStyle(
                            fontFamily: 'Lora',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: 100,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Lora',
                            ),
                            controller: controllerCantidad,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Por favor, ingresa la cantidad';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Cantidad',
                              labelStyle: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Lora',
                              ),
                            ),
                            onSaved: (value) {
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Precio',
                          style: TextStyle(
                            fontFamily: 'Lora',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: 100,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Lora',
                            ),
                            controller: controllerPrecio,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Por favor, ingresa el precio';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Precio',
                              labelStyle: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Lora',
                              ),
                            ),
                            onSaved: (value) {
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        addData2();
                        controllerDescripcion.clear();
                        controllerTamano.clear();
                        controllerCantidad.clear();
                        controllerPrecio.clear();
                      }
                    },
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Productos Ingresados',
                style: TextStyle(
                  fontFamily: 'Lora',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: productosIngresados.length,
                  itemBuilder: (context, index) {
                    return ProductoIngresadoItem(
                      descripcion: productosIngresados[index],
                      cantidad: cantidadIngresada[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductoIngresadoItem extends StatelessWidget {
  final String descripcion;
  final String cantidad;

  ProductoIngresadoItem({
    required this.descripcion,
    required this.cantidad,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('$descripcion - $cantidad'),
      trailing: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Detalles del Producto'),
                content: Text('Descripción: $descripcion\nCantidad: $cantidad'),
                actions: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color.fromARGB(78, 3, 208, 226),
                          Color.fromARGB(255, 65, 178, 184),
                          Color.fromARGB(255, 113, 131, 135),
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(395, 60),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: const Text('Cerrar'),
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
