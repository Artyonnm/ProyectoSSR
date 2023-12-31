import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/login_screen.dart';

class RecuperarContrasena extends StatelessWidget {
  const RecuperarContrasena({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 100,
        ),
        children: <Widget>[
          const CircleAvatar(
            radius: 80,
            backgroundColor: Color.fromARGB(255, 6, 165, 168),
            backgroundImage: AssetImage('assets/images/mermelada.png'),
          ),
          const SizedBox(height: 20),
          const Center(
            // Centra el texto "Sabores de Santa Rosa"
            child: Text(
              'Recuperar contraseña',
              style: TextStyle(
                fontFamily: 'cursive',
                fontSize: 40,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
          const SizedBox(height: 50),
          const Text(
            'Ingresa tu dirección de correo electrónico para recuperar tu contraseña.',
            style: TextStyle(
              fontSize: 16,
              fontFamily: '',
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            enableInteractiveSelection: false,
            decoration: InputDecoration(
              hintText: 'Correo electrónico',
              labelText: 'Correo electrónico',
              suffixIcon: const Icon(Icons.email),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(395, 55),
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              child: const Text(
                'Recuperar Contraseña',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
