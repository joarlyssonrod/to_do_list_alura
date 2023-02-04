import 'package:flutter/material.dart';
import 'package:to_do_list_alura/Components/difficulty.dart';

class Tasks extends StatefulWidget {
  final String name;
  final String photo;
  final int difficulty;

  const Tasks(this.name, this.photo, this.difficulty, {Key? key})
      : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  int level = 0;

  @override
  Widget build(BuildContext context) {
    int lvlMax = widget.difficulty * 10;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: (level <= lvlMax) ? Colors.blue : mastery(lvlMax, level),
            ),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      width: 70,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image(
                            image: AssetImage(widget.photo),
                            fit: BoxFit.scaleDown,
                          )),
                    ),
                    SizedBox(
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style: const TextStyle(
                              fontSize: 22,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          Difficulty(
                            classification: widget.difficulty,
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            level++;
                          });
                        },
                        child: SizedBox(
                          height: 50,
                          child: Column(
                            children: const [
                              Icon(
                                Icons.arrow_drop_up,
                              ),
                              Text("Up"),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: widget.difficulty > 0
                            ? ((level / widget.difficulty) / 10)
                            : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Nivel: $level",
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Color mastery(int max, int nvl) {
  if (nvl <= (max * 2)) {
    return Colors.green;
  } else if (nvl <= (max * 3)) {
    return Colors.red;
  } else if (nvl <= (max * 4)) {
    return Colors.yellow;
  } else if (nvl <= (max * 5)) {
    return Colors.purple;
  } else {
    return Colors.blue;
  }
}