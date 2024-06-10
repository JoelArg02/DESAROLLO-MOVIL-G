import 'package:flutter/material.dart';
import 'worker_details_screen.dart';
import 'review_screen.dart';
import 'package:sueldotrabajadores/models/worker.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _numWorkersController = TextEditingController();
  final List<Worker> workers =
      []; // Lista de trabajadores, ajusta según tu lógica

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sueldo de Trabajadores'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _numWorkersController,
              decoration: InputDecoration(
                labelText: 'Número de Trabajadores',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                fillColor: Colors.grey[200],
                filled: true,
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                int numWorkers = int.parse(_numWorkersController.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        WorkerDetailsScreen(numWorkers: numWorkers),
                  ),
                );
              },
              icon: const Icon(Icons.input, color: Colors.white),
              label: const Text(
                'Ingresar Datos de Trabajadores',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
