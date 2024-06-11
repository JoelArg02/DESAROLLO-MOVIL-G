import 'package:flutter/material.dart';
import 'models/worker.dart';
import 'home_screen.dart';

class ResultsScreen extends StatelessWidget {
  final List<Worker> workers;

  const ResultsScreen({super.key, required this.workers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Resultados',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: workers.length,
              itemBuilder: (context, index) {
                Worker worker = workers[index];
                double grossSalary = worker.hoursWorked * worker.hourlyRate;
                double discount;

                if (grossSalary <= 150) {
                  discount = grossSalary * 0.05;
                } else if (grossSalary <= 300) {
                  discount = grossSalary * 0.07;
                } else {
                  discount = grossSalary * 0.09;
                }

                double netSalary = grossSalary - discount;

                return ListTile(
                  title: Text(worker.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Horas Trabajadas: ${worker.hoursWorked}'),
                      Text('Sueldo por Hora: ${worker.hourlyRate}'),
                      Text('Sueldo Bruto: ${grossSalary.toStringAsFixed(2)}'),
                      Text('Descuento: ${discount.toStringAsFixed(2)}'),
                      Text('Sueldo Neto: ${netSalary.toStringAsFixed(2)}'),
                    ],
                  ),
                  leading: const Icon(Icons.person, color: Colors.black),
                  tileColor: Colors.grey[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text('Volver a la Pantalla Principal'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
