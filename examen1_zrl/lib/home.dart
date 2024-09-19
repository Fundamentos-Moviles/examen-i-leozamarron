import 'package:examen1_zrl/more_info.dart';
import 'package:flutter/material.dart';
import 'package:examen1_zrl/utils/const.dart' as con;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List listaExamen;

  @override
  void initState() {
    listaExamen = List.from(con.listaExamen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///Forma de obtener el tamaño de nuestra pantalla
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),

            ///Crea un scrool
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 400,
                    height: 35,
                    padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      'Notificaciones de actividades',
                      style: TextStyle(
                          color: con.titulos,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    height: size.height,
                    width: size.width,
                    padding: const EdgeInsets.all(20.0),
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: listaExamen.length,
                      itemBuilder: (BuildContext context, int index) {
                        ///tipo var es una variable que se adapta o toma el
                        ///tipo de dato que se le asigna
                        var datos = listaExamen[index].toString().split('#');

                        ///$ - no usar
                        print('ID: ${datos[0]}');

                        return int.parse(datos[0]) % 2 == 0
                            ? createCard(
                                numero: datos[1],
                                titulo: datos[2],
                                descripcion: datos[3],
                                numeroEst: datos[4],
                                id: datos[0],

                                ///int i = 0;
                                ///i.toString();
                              )
                            : createdCard2(
                                datos[1], datos[2], int.parse(datos[0]));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              child: Container(
                color: con.fondo3,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'SEGUNDA VISTA: Leonel Zamarron Rangel',
                    style: TextStyle(fontSize: 15, color: con.efectos),
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const MoreInfo()));
              },
            ),
          )
        ],
      ),
      backgroundColor: con.fondo3,
    );
  }

  Container createdCard2(String numero, String txt, int id) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.only(bottom: 20.0),

      ///color: Colors.grey, /// -------------------------------------->  Estos dos atributos
      decoration: BoxDecoration(
        ///                                juntos, marcará un error por
        borderRadius: BorderRadius.circular(40),

        ///                  incompatibilidad de atributos
        color: Colors.white,

        /// ------------------------------------>
      ),
      child: Row(
        children: [
          Expanded(
              flex: 8,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(numero),
                  Text(txt),
                ],
              )),
          Expanded(
            flex: 2,

            ///Convertir cualquier widget con acción de boton
            child: InkWell(
              onTap: () {
                print("Se edita el dato del id: $id");
              },
              child: const Icon(Icons.edit),
            ),
          ),
          Expanded(
              flex: 2,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    listaExamen.removeAt(id);

                    ///Eliminar un dato de la listaExamen
                    showSnackBar('Se elimino el elemento con el id: $id', 15);
                  });
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                ),
              )),
        ],
      ),
    );
  }

  ///AREA PARA LAS FUNCIONES
  void showSnackBar(String texto, int duracion) {
    final snackBar = SnackBar(
      content: Text(texto),
      duration: Duration(seconds: duracion),
      action: SnackBarAction(
        onPressed: () {
          // Cualquier acción al dar clic sobre el widget
        },
        label: 'Cerrar',
      ),
    );

    // Muestra el SnackBar usando ScaffoldMessenger
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

// ignore: camel_case_types
class createCard extends StatelessWidget {
  ///Variable con final es decir que se le asignará valor más adelante
  final String numero;
  final String titulo;
  final String descripcion;
  final String numeroEst;
  final String id;
  const createCard({
    super.key,
    required this.numero,
    required this.titulo,
    required this.descripcion,
    required this.numeroEst,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.only(bottom: 20.0),

      ///color: Colors.grey, /// -------------------------------------->  Estos dos atributos
      decoration: BoxDecoration(
        ///                                juntos, marcará un error por
        borderRadius: BorderRadius.circular(40),

        ///                  incompatibilidad de atributos
        color: Colors.white,

        /// ------------------------------------>
      ),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Text(numero),
          ),
          Expanded(
            flex: 2,

            ///Convertir cualquier widget con acción de boton
            child: InkWell(
                onTap: () {
                  print("Se edita el dato del id: $id");
                },
                child: const Icon(Icons.edit)),
          ),
          const Expanded(
            flex: 2,
            child: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
