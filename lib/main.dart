import 'package:flutter/material.dart';
import 'custom_textfield.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AddTwoNumbersScreen(),
    );
  }
}

class AddTwoNumbersScreen extends StatefulWidget {
  const AddTwoNumbersScreen({super.key});

  @override
  State<AddTwoNumbersScreen> createState() => _AddTwoNumbersScreenState();
}

class _AddTwoNumbersScreenState extends State<AddTwoNumbersScreen> {
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();

  double result = 0;

  void addNumbers() {
    double n1 = double.tryParse(num1.text) ?? 0;
    double n2 = double.tryParse(num2.text) ?? 0;

    setState(() {
      result = n1 + n2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Two Numbers")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(
              controller: num1,
              hintText: "First number",
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: num2,
              hintText: "Second number",
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: addNumbers,
              child: const Text("Add Numbers"),
            ),
            const SizedBox(height: 20),
            Text(
              "Result: $result",
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
