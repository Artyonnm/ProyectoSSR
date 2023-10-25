import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistroUsuarios extends StatefulWidget {
  const RegistroUsuarios({Key? key}) : super(key: key);

  @override
  _RegistroUsuariosState createState() => _RegistroUsuariosState();
}

class _RegistroUsuariosState extends State<RegistroUsuarios> {
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerClave = TextEditingController();
  TextEditingController controllerCorreo = TextEditingController();

  var _formkey = GlobalKey<FormState>();
  String errorText = "";

  void addData() {
    var url = Uri.parse("http://192.168.1.2/tienda/adddata.php");

    http.post(url, body: {
      "type": "usuarios",
      "username": controllerUsername.text,
      "clave": controllerClave.text,
      "correo": controllerCorreo.text,
    }).then((response) {
      if (response.body.contains("El nombre de usuario ya está en uso.")) {
        setState(() {
          errorText =
              "El nombre de usuario ya está en uso. Por favor, elige otro.";
        });
      } else if (response.body
          .contains("El correo electrónico ya está en uso.")) {
        setState(() {
          errorText =
              "El correo electrónico ya está en uso. Por favor, elige otro.";
        });
      } else {
        Navigator.pushReplacementNamed(context, '/LoginPage');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 100,
        ),
        children: <Widget>[
          Column(
            children: [
              const CircleAvatar(
                radius: 80,
                backgroundColor: Color.fromARGB(255, 6, 165, 168),
                backgroundImage: AssetImage('assets/images/mermelada.png'),
              ),
              SizedBox(height: 20),
              const Text(
                'Registro de usuario',
                style: TextStyle(
                  fontFamily: 'cursive',
                  fontSize: 40,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              SizedBox(height: 40),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                        enableInteractiveSelection: false,
                        autofocus: true,
                        textCapitalization: TextCapitalization.characters,
                        controller: controllerUsername,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Ingresa un usuario";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Usuario',
                          labelText: 'Usuario',
                          suffixIcon: const Icon(Icons.verified_user),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        )),
                    const SizedBox(height: 20),
                    Text(
                      errorText, // Mostrar mensajes de error
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 14.0,
                      ),
                    ),
                    TextFormField(
                      enableInteractiveSelection: false,
                      obscureText: true,
                      controller: controllerClave,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Ingresa una contraseña";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Contraseña',
                        labelText: 'Contraseña',
                        suffixIcon: Icon(Icons.lock_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      enableInteractiveSelection: false,
                      controller: controllerCorreo,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Ingresa un correo electrónico";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Correo electrónico',
                        labelText: 'Correo electrónico',
                        suffixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: <Color>[
                            Color.fromARGB(78, 3, 208, 226),
                            Color.fromARGB(255, 65, 178, 184),
                            Color.fromARGB(255, 113, 131, 135),
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            addData();
                            Navigator.pushReplacementNamed(
                                context, '/LoginPage');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(395, 55),
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        child: const Text(
                          'Registrarse',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
