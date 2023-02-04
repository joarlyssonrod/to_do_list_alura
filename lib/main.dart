import 'package:flutter/material.dart';
import 'package:to_do_list_alura/Data/task_inherited.dart';
import 'package:to_do_list_alura/Screens/initial_screen.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return TaskInherited(child: const InitialScreen());
  }
}