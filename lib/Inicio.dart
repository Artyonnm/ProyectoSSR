import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/AgregaProductos.dart';
import 'package:flutter_responsive_login_ui/widgets/boton_regreso_provisorio.dart';

final LinearGradient customButtonGradient = const LinearGradient(
  colors: <Color>[
    Color.fromARGB(78, 3, 208, 226),
    Color.fromARGB(255, 65, 178, 184),
    Color.fromARGB(255, 113, 131, 135),
  ],
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
);

class InicioInv extends StatelessWidget {
  const InicioInv(BuildContext context, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 100,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              const Text(
                'Bienvenido a Sabores de Santa Rosa',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: '',
                  fontSize: 40,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AgregarProducto(),
                        ),
                      );
                    },
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        gradient: customButtonGradient,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            size: 40,
                            color: Colors.white,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Agregar productos',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  InkWell(
                    onTap: () {
                      // Redirige a pestaña ventas
                    },
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        gradient: customButtonGradient,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            size: 40,
                            color: Colors.white,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Ventas',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      // Redirige a pestaña ganancias
                    },
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        gradient: customButtonGradient,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.attach_money,
                            size: 40,
                            color: Colors.white,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Ganancias',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  InkWell(
                    onTap: () {
                      // Redirige a pestaña stock
                    },
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        gradient: customButtonGradient,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.store,
                            size: 40,
                            color: Colors.white,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Stock',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  // Redirige a pestaña historial
                },
                child: Container(
                  width: 260,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: customButtonGradient,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.history,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Historial',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              BotonProv(context),
            ],
          ),
        ),
      ),
    );
  }
}
