import 'dart:convert';
import 'package:appprueba/pages/Inicio.dart';
import 'package:appprueba/pages/Recuperar_Contrasena.dart';
import 'package:appprueba/pages/Registro.dart';
import 'package:appprueba/pallete.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const LoginApp());

String username = '';

class LoginApp extends StatelessWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App + mysql',
      home: LoginPage(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Pallete.backgroundColor,
      ),
      routes: <String, WidgetBuilder>{
        '/Inicio': (BuildContext context) => InicioInv(username: username),
        '/LoginPage': (BuildContext context) => LoginPage(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerUser = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  String mensajeUsuario = '';
  String mensajeContrasena = '';
  String mensaje = '';

  Future<List<dynamic>> login() async {
    if (controllerUser.text.isEmpty || controllerPass.text.isEmpty) {
      setState(() {
        mensajeUsuario =
            controllerUser.text.isEmpty ? 'Por favor, ingrese usuario.' : '';
        mensajeContrasena =
            controllerPass.text.isEmpty ? 'Por favor, ingrese contraseña.' : '';
        mensaje = '';
      });
      return [];
    }

    final response = await http.post(
      Uri.parse("http://10.0.2.2/tienda/login.php"),
      body: {
        "username": controllerUser.text,
        "clave": controllerPass.text,
      },
    );
    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        mensajeUsuario = 'Usuario o contraseña incorrectos';
        mensajeContrasena = 'Usuario o contraseña incorrectos';
        mensaje = '';
      });
    } else {
      Navigator.pushReplacementNamed(context, '/Inicio');
    }
    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              const SizedBox(height: 20),
              const Text(
                'Sabores de Santa Rosa',
                style: TextStyle(
                  fontFamily: 'Lora',
                  fontSize: 35,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                enableInteractiveSelection: false,
                autofocus: true,
                textCapitalization: TextCapitalization.characters,
                controller: controllerUser,
                decoration: InputDecoration(
                  hintText: 'Usuario',
                  labelText: 'Usuario',
                  suffixIcon: const Icon(Icons.verified_user),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              if (mensajeUsuario.isNotEmpty)
                Text(
                  mensajeUsuario,
                  style: const TextStyle(
                    fontFamily: 'Lora',
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
              const SizedBox(height: 20),
              TextField(
                enableInteractiveSelection: false,
                obscureText: true,
                controller: controllerPass,
                decoration: InputDecoration(
                  hintText: 'Contraseña',
                  labelText: 'Contraseña',
                  suffixIcon: const Icon(Icons.lock_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              if (mensajeContrasena.isNotEmpty)
                Text(
                  mensajeContrasena,
                  style: const TextStyle(
                    fontFamily: 'Lora',
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
              const SizedBox(height: 20),
              if (mensaje.isNotEmpty)
                Text(
                  mensaje,
                  style: const TextStyle(
                    fontFamily: 'Lora',
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
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
                    login();
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(395, 55),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  child: const Text(
                    'Ingresar',
                    style: TextStyle(
                      fontFamily: 'Lora',
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              BotonRegistro(context),
              OlvidoContrasena(context),
            ],
          ),
        ],
      ),
    );
  }
}

class BotonRegistro extends StatelessWidget {
  const BotonRegistro(BuildContext context, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const RegistroUsuarios(),
            ),
          );
        },
        child: const TextButton(
          onPressed: null,
          child: Text(
            'Registro de usuario',
            style: TextStyle(
              fontFamily: 'Lora',
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
    );
  }
}

class OlvidoContrasena extends StatelessWidget {
  const OlvidoContrasena(BuildContext context, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RecuperarContrasena(),
            ),
          );
        },
        child: const TextButton(
          onPressed: null,
          child: Text(
            '¿Olvidó su contraseña?',
            style: TextStyle(
              fontFamily: 'Lora',
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
    );
  }
}
