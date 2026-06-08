import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String display = "0";

  void buttonPressed(String value) {
    setState(() {
      if (display == "0") {
        display = value;
      } else {
        display += value;
      }
    });
  }

Widget calcButton(String text) {
  return Padding(
    padding: const EdgeInsets.all(6),
    child: ElevatedButton(
      onPressed: () => buttonPressed(text),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(20),
              child: Text(
                display,
                style: const TextStyle(fontSize: 40),
              ),
            ),
          ),
Expanded(
  child: GridView.count(
    crossAxisCount: 4,
    padding: const EdgeInsets.all(20),
    childAspectRatio: 1.2,
    children: [
      calcButton("7"),
      calcButton("8"),
      calcButton("9"),
      calcButton("/"),

      calcButton("4"),
      calcButton("5"),
      calcButton("6"),
      calcButton("*"),

      calcButton("1"),
      calcButton("2"),
      calcButton("3"),
      calcButton("-"),

      calcButton("0"),
      calcButton("C"),
      calcButton("="),
      calcButton("+"),
    ],
  ),
)
        ],
      ),
    );
  }
}