
class Cliente {
  final String nombre;
  final double saldoAnterior;
  final double montoCompras;
  final double pagoDeposito;

  Cliente({
    required this.nombre,
    required this.saldoAnterior,
    required this.montoCompras,
    required this.pagoDeposito,
  });

  double get saldoBase {
    return saldoAnterior + montoCompras;
  }

  double get saldoActual {
    double saldo = saldoBase;
    if (esMoroso) {
      saldo += (saldoAnterior * 0.12) + 200;
    }
    return saldo;
  }

  double get pagoMinimo {
    return saldoActual * 0.15;
  }

  double get pagoLibreIntereses {
    return saldoActual * 0.85;
  }

  bool get esMoroso {
    return pagoDeposito < (saldoAnterior * 0.15);
  }

  double get interesGanado {
    if (esMoroso) {
      return (saldoAnterior * 0.12);
    }
    return 0;
  }
}

final List<Cliente> clientes = [
  Cliente(
    nombre: 'Juan Perez',
    saldoAnterior: 1000,
    montoCompras: 500,
    pagoDeposito: 20,
  ),
  Cliente(
    nombre: 'Rodrigo Baez',
    saldoAnterior: 1500,
    montoCompras: 300,
    pagoDeposito: 400,
  ),
  Cliente(
    nombre: 'Paula Aldaz',
    saldoAnterior: 950,
    montoCompras: 500,
    pagoDeposito: 400,
  ),
];
