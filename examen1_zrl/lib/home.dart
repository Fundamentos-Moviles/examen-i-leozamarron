import 'package:examen1_zrl/more_info.dart';
import 'package:flutter/material.dart';
import 'package:examen1_zrl/utils/const.dart' as con;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<String> listaExamen;
  final List<int> numerosNoEliminables = [10, 15, 20, 23];

  @override
  void initState() {
    listaExamen = List.from(con.listaExamen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// Forma de obtener el tamaño de nuestra pantalla
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),

            /// Crea un scroll
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    width: 400,
                    height: 35,
                    padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Notificaciones de actividades',
                      style: TextStyle(
                        color: con.titulos,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height - 150,
                    width: size.width,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: listaExamen.length,
                      itemBuilder: (BuildContext context, int index) {
                        var datos = listaExamen[index].toString().split('#');
                        int id = int.tryParse(datos[0]) ??
                            -1; // Convertir ID a entero
                        print('ID: $id');

                        return id % 2 == 0
                            ? CreateCard(
                                numero: datos[1],
                                titulo: datos[2],
                                descripcion: datos[3],
                                numeroEst: datos[4],
                                id: id.toString(),
                                lista: listaExamen,
                                onDelete: () =>
                                    _eliminarElemento(int.parse(datos[1]), id),
                              )
                            : createdCard2(datos[1], datos[2], id);
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MoreInfo()),
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: con.fondo3,
    );
  }

  /// Función para eliminar un elemento, mostrando Snackbar y evitando la eliminación de ciertos IDs
  void _eliminarElemento(int numero, int id) {
    if (numerosNoEliminables.contains(numero)) {
      showSnackBar('El elemento con numero $numero no se puede eliminar', 3);
    } else {
      setState(() {
        listaExamen.removeAt(id);
        _actualizarIds(id); // Actualizar los numeros mayores
        showSnackBar('Se eliminó el elemento con el numero: $numero', 3);
      });
    }
  }

  /// Función para actualizar los IDs de los elementos que son mayores al ID eliminado
  void _actualizarIds(int idEliminado) {
    for (int i = 0; i < listaExamen.length; i++) {
      var datos = listaExamen[i].split('#');
      int id = int.tryParse(datos[0]) ?? -1;

      if (id > idEliminado) {
        id--; // Reducir el ID en 1
        datos[0] = id.toString(); // Actualizar el ID en la lista
        listaExamen[i] = datos.join('#'); // Reemplazar el elemento actualizado
      }
    }
  }

  Container createdCard2(String numero, String txt, int id) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.white,
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
            ),
          ),
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {
                print("Se edita el dato con el índice: $id");
              },
              child: const Icon(Icons.edit),
            ),
          ),
          Expanded(
            flex: 2,
            child: IconButton(
              onPressed: () {
                _eliminarElemento(int.parse(numero), id);
              },
              icon: const Icon(Icons.delete, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  void showSnackBar(String texto, int duracion) {
    final snackBar = SnackBar(
      content: Text(texto),
      duration: Duration(seconds: duracion),
      action: SnackBarAction(
        onPressed: () {},
        label: 'Cerrar',
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class CreateCard extends StatelessWidget {
  final String numero;
  final String titulo;
  final String descripcion;
  final String numeroEst;
  final String id;
  final List lista;
  final VoidCallback onDelete;

  const CreateCard({
    super.key,
    required this.numero,
    required this.titulo,
    required this.descripcion,
    required this.numeroEst,
    required this.id,
    required this.lista,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Text(numero),
          ),
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {
                print("Se edita el dato con el id: $id");
              },
              child: const Icon(Icons.edit),
            ),
          ),
          Expanded(
            flex: 2,
            child: IconButton(
              onPressed: onDelete,
              icon: const Icon(Icons.delete),
            ),
          ),
        ],
      ),
    );
  }
}
