import 'package:flutter/material.dart';

class AgregarProducto extends StatefulWidget {
  @override
  _AgregarProductoState createState() => _AgregarProductoState();
}

class _AgregarProductoState extends State<AgregarProducto> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _descripcion = "";
  String _tamano = "Mediano";
  int _cantidad = 0;

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
                  decoration: const InputDecoration(
                    labelText: 'Descripción del Producto',
                    labelStyle: TextStyle(fontSize: 16),
                    border: InputBorder.none,
                  ),
                  minLines: 1,
                  maxLines: null,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingresa una descripción';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      _descripcion = value!;
                    });
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
                        const SizedBox(height: 20),
                        DropdownButton<String>(
                          value: _tamano,
                          onChanged: (value) {
                            setState(() {
                              _tamano = value!;
                            });
                          },
                          items: <String>['Mediano', 'Grande']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
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
                            decoration: const InputDecoration(
                              labelText: 'Cantidad',
                              labelStyle: TextStyle(fontSize: 16),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Por favor, ingresa la cantidad';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              setState(() {
                                _cantidad = int.parse(value!);
                              });
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
                        _formKey.currentState!.save();
                        print('Descripción: $_descripcion');
                        print('Tamaño: $_tamano');
                        print('Cantidad: $_cantidad');
                      }
                    },
                    child: Icon(Icons.add),
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
