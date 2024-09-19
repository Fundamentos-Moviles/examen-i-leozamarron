import 'package:flutter/material.dart';
import 'package:examen1_zrl/utils/const.dart';
import 'package:examen1_zrl/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int band = 0;
  final usuario = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const radius = 25.0;
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Container(
                    width: size.width / 4,
                    height: size.height / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      color: fondo2,
                    )),
                Container(
                    width: size.width / 4,
                    height: size.height / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      color: fondo,
                    )),
                Container(
                    width: size.width / 4,
                    height: size.height / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      color: fondo3,
                    )),
                Container(
                    width: size.width / 4,
                    height: size.height / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      color: fondo4,
                    )),
              ],
            )),
            Expanded(
                child: Row(
              children: [
                Container(
                    width: size.width / 4,
                    height: size.height / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      color: fondo4,
                    )),
                Container(
                    width: size.width / 4,
                    height: size.height / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      color: fondo3,
                    )),
                Container(
                    width: size.width / 4,
                    height: size.height / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      color: fondo2,
                    )),
                Container(
                    width: size.width / 4,
                    height: size.height / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      color: fondo,
                    )),
              ],
            )),
            Expanded(
                child: Row(
              children: [
                Container(
                    width: size.width / 4,
                    height: size.height / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      color: fondo3,
                    )),
                Container(
                    width: size.width / 4,
                    height: size.height / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      color: fondo4,
                    )),
                Container(
                    width: size.width / 4,
                    height: size.height / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      color: fondo,
                    )),
                Container(
                    width: size.width / 4,
                    height: size.height / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      color: fondo2,
                    )),
              ],
            )),
          ],
        ),
        Padding(
            padding:
                const EdgeInsets.only(top: 200, left: 40, bottom: 0, right: 40),
            child: Container(
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(radius)),
              child: Column(
                mainAxisSize: MainAxisSize.min,

                ///Toma el tamaño de sus hijos widgets
                children: [
                  const SizedBox(
                    height: 32.0,
                  ),
                  const Text(
                    'Bienvenido a tu primer EXAMEN',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: titulos),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Container(
                    width: 300,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0)),
                    child: TextFormField(
                      controller: usuario,
                      decoration: InputDecoration(
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 93, 93, 93)),
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          hintText: 'Correo/Usuario',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide:
                                  const BorderSide(style: BorderStyle.solid))),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    width: 300,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0)),
                    child: TextFormField(
                      controller: pass,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 93, 93, 93)),
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          hintText: 'Contraseña',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide:
                                  const BorderSide(style: BorderStyle.solid))),
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  SizedBox(
                    height: band == 0 ? 0 : 16,
                    child: Text(
                      band == 0
                          ? ''
                          : band == 1
                              ? 'Contraseña incorrecta'
                              : band == 2
                                  ? 'Usuario incorrecto'
                                  : 'Datos incompletos',
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: botones,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        minimumSize: const Size(260, 30)),
                    onPressed: () {
                      validaUser();
                    },
                    child: const Text(
                      'Iniciar Sesión',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Text(
                    'Mi primer examen, ¿estará sencillo?',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 28.0,
                  ),
                ],
              ),
            ))
      ]),
      backgroundColor: fondo,
    );
  }

  void validaUser() {
    ///Detectar y actualizar el estado de la vista actual
    setState(() {
      band = 0;
      print('Usuario: ${usuario.text}');
      print("Contraseña: ${pass.text}");
      //solo puede ingresar si escribi user = User01 y pass = Pass02
      //un mensaje si es valido o incorrecto
      if (usuario.text == 'test' && pass.text == 'FDM1') {
        print('Usuario valido');
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Home()));
      } else if (usuario.text == 'test') {
        band = 1;
      } else if (pass.text == 'FDM1') {
        band = 2;
      } else {
        band = 3;
      }
      const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.account_box), Text('Ingresar')]);
    });
  }
}
