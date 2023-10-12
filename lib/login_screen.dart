import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/widgets/Olvido_su_contrasena.dart';
import 'package:flutter_responsive_login_ui/widgets/boton_registro.dart';
import 'package:flutter_responsive_login_ui/widgets/Boton_ingresar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                'Nacho weko aguante el Colo',
                style: TextStyle(
                  fontFamily: 'cursive',
                  fontSize: 40,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              SizedBox(height: 40),
              TextField(
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
              TextField(
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
              Boton_ingresar(context),
              SizedBox(height: 5),
              BotonRegistro(context),
              OlvidoContrasena(context),
            ],
          ),
        ],
      ),
    );
  }
}
