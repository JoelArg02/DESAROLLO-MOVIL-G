import 'package:flutter/material.dart';
import 'pages/home_screen.dart';
import 'pages/home.dart';
import 'pages/worker_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicios',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
      routes: {
        '/homeScreen': (context) => HomeScreen(),
        '/home': (context) => Home(),
        '/workerDetails': (context) =>
            WorkerDetailsScreen(numWorkers: 0), // Añade esta línea
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: const Text('Ejercicio 1 '),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/homeScreen');
              },
              child: const Text('Ejercicio 2'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
