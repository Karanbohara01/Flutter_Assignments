import 'package:flutter/material.dart';

class AreaOfCircle extends StatefulWidget {
  const AreaOfCircle({super.key});

  @override
  State<AreaOfCircle> createState() => _AreaOfCircleState();
}

class _AreaOfCircleState extends State<AreaOfCircle> {
  final TextEditingController _radiusController = TextEditingController();
  double _result = 0;

  // Function to calculate the area of the circle
  void _calculateArea() {
    double radius = double.tryParse(_radiusController.text) ?? 0;

    setState(() {
      _result = 3.14 * radius * radius;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Area of Circle Calculator'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: _radiusController, // Attach the controller here
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Radius",
                  labelText: "Radius",
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'Area: ${_result.toStringAsFixed(2)} ', // Display result with 2 decimal places
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateArea, // Call the function directly
                child: const Text('Calculate'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _radiusController.dispose(); // Dispose of the controller when not needed
    super.dispose();
  }
}
