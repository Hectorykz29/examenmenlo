import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double loanAmount = 10000;

  bool _isPressed = false;

  void navigateToLoanCalculator() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Calculadora(loanAmount: loanAmount),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.orange,
                border: Border.all(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(60),
              ),
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Calculadora de Préstamos',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'Obtenga un préstamo bancario con solo unos pocos clics',
              style: TextStyle(
                fontSize: 18, 
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTapDown: (_) {
                setState(() {
                  _isPressed = true;
                });
              },
              onTapUp: (_) {
                setState(() {
                  _isPressed = false;
                });
                navigateToLoanCalculator();
              },
              onTapCancel: () {
                setState(() {
                  _isPressed = false;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: _isPressed ? 110 : 100,
                height: _isPressed ? 55 : 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 9, 42, 69),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Empezar',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class Calculadora extends StatefulWidget {
  final double loanAmount;

  Calculadora({required this.loanAmount});

  @override
  CalculadoraPage createState() => CalculadoraPage();
}

class CalculadoraPage extends State<Calculadora> {
  late double loanAmount;
  double interestRate = 10.0;
  int loanTerm = 12;

  @override
  void initState() {
    super.initState();
    loanAmount = widget.loanAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Préstamos'),
        backgroundColor: const Color.fromARGB(255, 9, 42, 69),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Monto del préstamo:',
                style: TextStyle(
                  fontSize: 18,
                  color: const Color.fromARGB(255, 9, 42, 69),
                  fontWeight: FontWeight.bold, // Texto en negrita
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'S/. ${loanAmount.toStringAsFixed(2).replaceAllMapped(r'(\d)(?=(\d{3})+\.)', (Match m) => '${m[1]},')}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
              Slider(
                value: loanAmount,
                min: 1000,
                max: 50000,
                divisions: 490,
                activeColor: Colors.orange,
                inactiveColor: Colors.orange.withOpacity(0.3),
                onChanged: (value) {
                  setState(() {
                    loanAmount = value;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'S/. 1,000.00',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 9, 42, 69),
                    ),
                  ),
                  Text(
                    'S/. 50,000.00',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 9, 42, 69),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                'Plazo del préstamo',
                style: TextStyle(
                  fontSize: 18,
                  color: const Color.fromARGB(255, 9, 42, 69),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$loanTerm meses',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 9, 42, 69), // Color marino
                    ),
                  ),
                ],
              ),
              Slider(
                value: loanTerm.toDouble(),
                min: 6,
                max: 36,
                activeColor: Colors.orange,
                inactiveColor: Colors.orange.withOpacity(0.3),
                onChanged: (value) {
                  setState(() {
                    loanTerm = value.toInt();
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '6 meses',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 9, 42, 69),
                    ),
                  ),
                  Text(
                    '36 meses',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 9, 42, 69),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                'Tasa de interés anual',
                style: TextStyle(
                  fontSize: 18,
                  color: const Color.fromARGB(255, 9, 42, 69),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${interestRate.toStringAsFixed(1)}%',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 9, 42, 69),
                    ),
                  ),
                ],
              ),
              Slider(
                value: interestRate,
                min: 10,
                max: 50,
                activeColor: Colors.orange,
                inactiveColor: Colors.orange.withOpacity(0.3),
                onChanged: (value) {
                  setState(() {
                    interestRate = value;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '10%',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 9, 42, 69),
                    ),
                  ),
                  Text(
                    '50%',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 9, 42, 69),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetalleCalculadora(
                        loanAmount: loanAmount,
                        interestRate: interestRate,
                        loanTerm: loanTerm,
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.calculate),
                label: Text('Calcular'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 9, 42, 69),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetalleCalculadora extends StatelessWidget {
  final double loanAmount;
  final double interestRate;
  final int loanTerm;

  DetalleCalculadora({
    required this.loanAmount,
    required this.interestRate,
    required this.loanTerm,
  });
  double calculateMonthlyInstallment() {
    double monthlyInterestRate = interestRate / 12 / 100;
    return loanAmount *
        monthlyInterestRate *
        pow(1 + monthlyInterestRate, loanTerm) /
        (pow(1 + monthlyInterestRate, loanTerm) - 1);
  }
  @override
  Widget build(BuildContext context) {
    double monthlyInstallment = calculateMonthlyInstallment();
    double totalPayment = monthlyInstallment * loanTerm;
    double totalInterest = totalPayment - loanAmount;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Préstamo'),
        backgroundColor: const Color.fromARGB(255, 9, 42, 69),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildDetailRow(
                'Monto del préstamo:', 'S/. ${loanAmount.toStringAsFixed(2)}'),
            Divider(color: Colors.grey.shade400),
            buildDetailRow('Tasa de interés anual:',
                '${interestRate.toStringAsFixed(1)}%'),
            Divider(color: Colors.grey.shade400),
            buildDetailRow('Plazo del préstamo:', '$loanTerm meses'),
            Divider(color: Colors.grey.shade400),
            buildDetailRow('Cuota mensual:',
                'S/. ${monthlyInstallment.toStringAsFixed(2)}'),
            Divider(color: Colors.grey.shade400),
            buildDetailRow('Total de intereses a pagar:',
                'S/. ${totalInterest.toStringAsFixed(2)}'),
            Divider(color: Colors.grey.shade400),
            buildDetailRow('Total a pagar:',
                'S/. ${totalPayment.toStringAsFixed(2)}'),
            SizedBox(height: 30.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => comprovante(),
                    ),
                  );
                },
                child: Text('Saca tu préstamo'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 9, 42, 69),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: const Color.fromARGB(255, 9, 42, 69),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}

class comprovante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aprobación de Préstamo'),
        backgroundColor: const Color.fromARGB(255, 9, 42, 69),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.orange,
              size: 100.0,
            ),
            SizedBox(height: 20.0),
            Text(
              '¡FELICIDADES!',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 9, 42, 69),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Su crédito fue aprobado',
              style: TextStyle(
                fontSize: 24,
                color: const Color.fromARGB(255, 9, 42, 69),
              ),
            ),
            SizedBox(height: 40.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Volver'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 9, 42, 69),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
