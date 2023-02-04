import 'package:flutter/material.dart';
import 'package:to_do_list_alura/Components/tasks.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Tasks> taskList = [
    const Tasks("Aprender Flutter", "assets/images/dash.jpeg", 3),
    const Tasks("Andar de bike", "assets/images/bike.webp", 2),
    const Tasks("Ler", "assets/images/livro.png", 4),
    const Tasks("Meditar", "assets/images/meditar.jpeg", 1),
    const Tasks("Jogar", "assets/images/jogar.webp", 5)
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Tasks(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
    context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    return true;
  }
}