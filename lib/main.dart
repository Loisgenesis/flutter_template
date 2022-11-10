import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OWWN Coding Challenge',
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const Scaffold(
        body: Center(
          child: Text(
            'OWWN Coding Challenge',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
