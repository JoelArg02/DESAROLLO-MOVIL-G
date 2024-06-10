import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'clientesList.dart';

class Clientes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Clientes();
}

class _Clientes extends State<Clientes> {
  Cliente? clienteSeleccionado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sección Clientes'),
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
            image: AssetImage("assets/fondo1.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.darken,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<Cliente>(
              hint: Text('Selecciona un cliente'),
              value: clienteSeleccionado,
              dropdownColor: Color.fromRGBO(5, 23, 44, 1),
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              onChanged: (Cliente? newValue) {
                setState(() {
                  clienteSeleccionado = newValue;
                });
              },
              items: clientes.map<DropdownMenuItem<Cliente>>((Cliente cliente) {
                return DropdownMenuItem<Cliente>(
                  value: cliente,
                  child: Text(
                    cliente.nombre,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 25),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (clienteSeleccionado != null) {
                    mostrarResultado(context, 'Saldo Actual', clienteSeleccionado!.saldoActual.toStringAsFixed(2));
                  }
                },
                child: Text(
                  'Saldo Actual',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (clienteSeleccionado != null) {
                    mostrarResultado(context, 'Pago Mínimo', clienteSeleccionado!.pagoMinimo.toStringAsFixed(2));
                  }
                },
                child: Text(
                  'Pago Mínimo',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (clienteSeleccionado != null) {
                    mostrarResultado(context, 'Pago Libre Intereses', clienteSeleccionado!.pagoLibreIntereses.toStringAsFixed(2));
                  }
                },
                child: Text(
                  'Pago Libre Intereses',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void mostrarResultado(BuildContext context, String titulo, String resultado) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(resultado),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}