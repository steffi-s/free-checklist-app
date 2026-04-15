import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Free Checklist App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Free Checklist App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Free Checklist App'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        // Gradient from orange (left) to red (right)
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange, Colors.red],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),
      body: const Center(
        child: Card(
          elevation: 4, // light drop shadow
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          // Card has a single child: a Padding that contains the Text
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Welcome to Free Checklist App!',
              style: TextStyle(fontSize: 18), // medium size
            ),
          ),
        ),
      ),
    );
  }
}
