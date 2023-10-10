import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/widgets/Recuperar_Contrasena.dart';

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
              builder: (context) => RecuperarContrasena(),
            ),
          );
        },
        child: const TextButton(
          onPressed: null,
          child: Text(
            '¿Olvidó su contraseña?',
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
