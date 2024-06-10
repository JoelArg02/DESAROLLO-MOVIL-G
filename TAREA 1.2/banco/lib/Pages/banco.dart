import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'clientesList.dart';

class Banco extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Banco();
}

class _Banco extends State<Banco> {
  double interesTotal = 0;

  @override
  void initState() {
    super.initState();
    calcularInteresTotal();
  }

  void calcularInteresTotal() {
    interesTotal = clientes.fold(0, (total, cliente) => total + cliente.interesGanado);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sección Banco'),
        backgroundColor: Color.fromRGBO(5, 23, 44, 0.9),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/fondo2.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.darken,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 150),
            Text(
              'Interés Total Ganado:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 50),
            Text(
              '\$$interesTotal',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}