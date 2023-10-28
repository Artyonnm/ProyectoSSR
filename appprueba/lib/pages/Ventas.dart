import 'package:appprueba/pallete.dart';
import 'package:flutter/material.dart';

class PaginaVentas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.backgroundColor,
        title: Text('Página de Ventas'),
        titleTextStyle: const TextStyle(
          fontFamily: 'Lora',
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Puedes agregar más elementos, como campos de entrada de datos, aquí si es necesario.
            ElevatedButton(
              onPressed: () {
                // Aquí puedes agregar la lógica para llevar a cabo la venta.
                // Esto podría incluir la interacción con una base de datos o realizar otras acciones necesarias.
                // Por ejemplo, podrías mostrar un diálogo de confirmación de venta.
              },
              child: const Text(
                'Vender',
                style: TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'Lora',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
