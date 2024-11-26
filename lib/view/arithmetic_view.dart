import 'package:flutter/material.dart';

class ArithmeticView extends StatefulWidget {
  const ArithmeticView({super.key});

  @override
  State<ArithmeticView> createState() => _ArithmeticViewState();
}

class _ArithmeticViewState extends State<ArithmeticView> {
  double? first;
  double? second;
  String result = '';

  // Function to safely parse input and handle errors
  void _parseInput(String value, bool isFirst) {
    setState(() {
      try {
        if (value.isEmpty) {
          result = 'Please enter both numbers';
          return;
        }
        if (isFirst) {
          first = double.parse(value);
        } else {
          second = double.parse(value);
        }
      } catch (e) {
        result = 'Invalid input: Enter numeric values only';
      }
    });
  }

  // Clear all inputs and results
  void _clearFields() {
    setState(() {
      first = null;
      second = null;
      result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arithmetic Calculator'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                onChanged: (value) => _parseInput(value, true),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter First Number',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                onChanged: (value) => _parseInput(value, false),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Second Number',
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Result: $result',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (first != null && second != null) {
                        setState(() {
                          result =
                              'Sum: ${(first! + second!).toStringAsFixed(2)}';
                        });
                      } else {
                        result = 'Please enter both numbers';
                      }
                    },
                    child: const Text('Addition'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (first != null && second != null) {
                        setState(() {
                          result =
                              'Difference: ${(first! - second!).toStringAsFixed(2)}';
                        });
                      } else {
                        result = 'Please enter both numbers';
                      }
                    },
                    child: const Text('Subtraction'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (first != null && second != null) {
                        setState(() {
                          result =
                              'Product: ${(first! * second!).toStringAsFixed(2)}';
                        });
                      } else {
                        result = 'Please enter both numbers';
                      }
                    },
                    child: const Text('Multiplication'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (first != null && second != null) {
                        if (second != 0) {
                          setState(() {
                            result =
                                'Quotient: ${(first! / second!).toStringAsFixed(2)}';
                          });
                        } else {
                          setState(() {
                            result = 'Cannot divide by zero';
                          });
                        }
                      } else {
                        result = 'Please enter both numbers';
                      }
                    },
                    child: const Text('Division'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _clearFields,
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                child: const Text('Clear Fields'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
