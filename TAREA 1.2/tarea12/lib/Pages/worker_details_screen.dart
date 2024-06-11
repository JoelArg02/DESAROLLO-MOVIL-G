import 'package:flutter/material.dart';
import 'models/worker.dart';
import 'results_screen.dart';

class WorkerDetailsScreen extends StatefulWidget {
  final int numWorkers;

  const WorkerDetailsScreen({super.key, required this.numWorkers});

  @override
  // ignore: library_private_types_in_public_api
  _WorkerDetailsScreenState createState() => _WorkerDetailsScreenState();
}

class _WorkerDetailsScreenState extends State<WorkerDetailsScreen> {
  final List<Worker> workers = [];
  final List<TextEditingController> _nameControllers = [];
  final List<TextEditingController> _hoursControllers = [];
  final List<TextEditingController> _rateControllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.numWorkers; i++) {
      _nameControllers.add(TextEditingController());
      _hoursControllers.add(TextEditingController());
      _rateControllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (var controller in _nameControllers) {
      controller.dispose();
    }
    for (var controller in _hoursControllers) {
      controller.dispose();
    }
    for (var controller in _rateControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _calculateSalaries() {
    workers.clear();
    for (int i = 0; i < widget.numWorkers; i++) {
      String name = _nameControllers[i].text;
      int hours = int.parse(_hoursControllers[i].text);
      double rate = double.parse(_rateControllers[i].text);
      double grossSalary = hours * rate;
      double discount;

      if (grossSalary <= 150) {
        discount = grossSalary * 0.05;
      } else if (grossSalary <= 300) {
        discount = grossSalary * 0.07;
      } else {
        discount = grossSalary * 0.09;
      }

      double netSalary = grossSalary - discount;

      workers.add(Worker(
        name: name,
        hoursWorked: hours,
        hourlyRate: rate,
        netSalary: netSalary,
      ));
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsScreen(workers: workers),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalles de Trabajadores',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: widget.numWorkers,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: _nameControllers[index],
                  decoration: InputDecoration(
                    labelText: 'Nombre del Trabajador ${index + 1}',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _hoursControllers[index],
                  decoration: InputDecoration(
                    labelText: 'Horas Trabajadas',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _rateControllers[index],
                  decoration: InputDecoration(
                    labelText: 'Sueldo por Hora',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _calculateSalaries,
            backgroundColor: Colors.black,
            child: const Icon(Icons.calculate, color: Colors.white),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/',
                (Route<dynamic> route) => false,
              );
            },
            backgroundColor: Colors.black,
            child: const Icon(Icons.home, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
