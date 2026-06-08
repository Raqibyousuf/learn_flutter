import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}ce

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Raqib Yousuf',
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  void decrement() {
    setState(() {
      counter--;
    });
  }

  void reset() {
    setState(() {
      counter = 0;
    });
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF1F1C2C),
        Color(0xFF928DAB),
      ],
    ),
  ),

    appBar: AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: const Text(
        'Counting and More',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    body: Center(
      child: Container(
        padding: const EdgeInsets.all(30),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(25),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Counter Value",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 24,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              '$counter',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 100,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                FloatingActionButton(
                  heroTag: "minus",
                  onPressed: decrement,
                  child: const Icon(Icons.remove,size: 35),
                ),

                const SizedBox(width: 20),

                ElevatedButton.icon(
                  onPressed: reset,
                  icon: const Icon(Icons.refresh),
                  label: const Text("Reset"),
                ),

                const SizedBox(width: 20),

                FloatingActionButton(
                  heroTag: "plus",
                  onPressed: increment,
                  child: const Icon(Icons.add,size: 35),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
}