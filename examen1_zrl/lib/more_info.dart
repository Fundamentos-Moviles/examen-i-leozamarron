import 'package:flutter/material.dart';

class MoreInfo extends StatefulWidget {
  const MoreInfo({super.key});

  @override
  State<MoreInfo> createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  final List<int> _boxes = [];

  void _addBox() {
    setState(() {
      _boxes.add(_boxes.length + 1);
      if (_boxes.length % 12 == 0) {
// Reiniciamos a una fila
      } else {
// Incrementamos el número de cajas por fila
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('More Info'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _addBox,
              child: const Text('Agregar Recuadro'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: (_boxes.length / 12).ceil(),
                itemBuilder: (context, index) {
                  int start = index * 12;
                  int end = start + 12;
                  List<int> currentRow = _boxes.sublist(
                      start, end > _boxes.length ? _boxes.length : end);
                  return Row(
                    children: currentRow.map((box) {
                      return Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(4.0),
                          color: Colors.blue,
                          child: Center(
                            child: Text('${box % 12 == 0 ? '12' : box % 12}'),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
