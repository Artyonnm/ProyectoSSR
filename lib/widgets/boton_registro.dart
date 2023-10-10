import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/widgets/boton_registro2.dart';

class BotonRegistro extends StatelessWidget {
  const BotonRegistro(BuildContext context, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RegistroScreen(),
            ),
          );
        },
        child: const TextButton(
          onPressed: null,
          child: Text(
            'Registro de usuario',
            style: TextStyle(
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

class RegistroScreen extends StatelessWidget {
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
                child: Column(
                  children: [
                    TextFormField(
                      enableInteractiveSelection: false,
                      autofocus: true,
                      textCapitalization: TextCapitalization.characters,
                      decoration: InputDecoration(
                        hintText: 'Usuario',
                        labelText: 'Usuario',
                        suffixIcon: Icon(Icons.verified_user),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      enableInteractiveSelection: false,
                      obscureText: true,
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
                    BotonRegistro2(context), // Botón de registro
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
