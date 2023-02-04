import 'package:flutter/material.dart';
import 'package:to_do_list_alura/Data/task_inherited.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.taskContext});

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController controllerTask = TextEditingController();
  TextEditingController controllerImage = TextEditingController();
  TextEditingController controllerDifficulty = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Adicionar Tarefa"),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(8),
            width: 390,
            height: 580,
            decoration: BoxDecoration(
                color: const Color.fromARGB(115, 163, 156, 156),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 3)),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Digite o nome para a sua tarefa';
                        }
                        return null;
                      },
                      controller: controllerTask,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        labelText: 'Nome da Tarefa',
                        //helperText: 'Aprender a andar de moto',
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty ||
                            int.parse(value) > 5 ||
                            int.parse(value) < 1) {
                          return 'Digite a dificuldade entre 1 e 5';
                        }
                        return null;
                      },
                      controller: controllerDifficulty,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Dificuldade',
                        //helperText: 'Digite a dificuldade entre 1 e 5',
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {});
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Digite uma URL válida da imagem para a sua tarefa';
                        }
                        return null;
                      },
                      controller: controllerImage,
                      keyboardType: TextInputType.url,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        fillColor: Colors.white70,
                        labelText: 'URL da Imagem',
                        //helperText:
                        //    'https://www.fluttericon.com/logo_dart_192px.svg',
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      width: 70,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(width: 2, color: Colors.blue),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image(
                          image: NetworkImage(controllerImage.text),
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset("assets/images/nophoto.png");
                          },
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print(controllerTask);
                        print(controllerDifficulty);
                        print(controllerImage);
                        TaskInherited.of(context).newTask(
                            controllerTask.text,
                            controllerImage.text,
                            int.parse(controllerDifficulty.text));

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Printando a nova Tarefa!'),
                          ),
                        );

                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Adicionar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}