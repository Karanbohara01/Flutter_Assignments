import 'package:flutter/material.dart';

class SimpleInterestView extends StatefulWidget {
  const SimpleInterestView({super.key});

  @override
  State<SimpleInterestView> createState() => _SimpleInterestViewState();
}

class _SimpleInterestViewState extends State<SimpleInterestView> {
  // Controllers to capture user input
  final TextEditingController _principleController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();

  // Variable to store the calculated result
  double _result = 0;

  // Function to calculate interest
  void _calculateInterest() {
    double principle = double.tryParse(_principleController.text) ?? 0;
    double time = double.tryParse(_timeController.text) ?? 0;
    double rate = double.tryParse(_rateController.text) ?? 0;

    // Calculate simple interest
    setState(() {
      _result = (principle * rate * time) / 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Interest Calculator'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _principleController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Principle Amount",
                  labelText: "Principle",
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _timeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Time (in years)",
                  labelText: "Time",
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _rateController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Rate of Interest",
                  labelText: "Rate",
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'Result: $_result',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _calculateInterest,
                  child: const Text("Calculate"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    _principleController.dispose();
    _timeController.dispose();
    _rateController.dispose();
    super.dispose();
  }
}
