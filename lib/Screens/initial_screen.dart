import 'package:flutter/material.dart';
import 'package:to_do_list_alura/Components/tasks.dart';
import 'package:to_do_list_alura/Data/task_inherited.dart';
import 'package:to_do_list_alura/Screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tarefas",
        ),
        leading: const SizedBox(),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (contextNew) =>
                            FormScreen(taskContext: context)));
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: ListView(
        children: TaskInherited.of(context).taskList,
      ),
    );
  }
}