import 'package:flutter/material.dart';
import 'package:sueldotrabajadores/models/worker.dart';

class ReviewScreen extends StatelessWidget {
  final List<Worker> workers;

  const ReviewScreen({Key? key, required this.workers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Revisar Trabajadores'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
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

          return ListTile(
            title: Text(worker.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Horas Trabajadas: ${worker.hoursWorked}'),
                Text('Sueldo por Hora: ${worker.hourlyRate}'),
                Text('Sueldo Bruto: ${grossSalary.toStringAsFixed(2)}'),
                Text('Descuento: ${discount.toStringAsFixed(2)}'),
                Text('Sueldo Neto: ${worker.netSalary.toStringAsFixed(2)}'),
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
    );
  }
}
