import 'package:dio_flutter_study/models/task.dart';
import 'package:dio_flutter_study/repositories/task_repository.dart';
import 'package:flutter/material.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  TaskRepository taskRepository = TaskRepository();
  List<Task> _tasks = [];
  TextEditingController descriptionController = TextEditingController();
  bool onlyUncompleted = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTasks(onlyUncompleted);
  }

  Future<void> getTasks(bool onlyUncompleted) async {
    _tasks = onlyUncompleted
        ? await taskRepository.getTasksIncomplete()
        : await taskRepository.getTasks();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            descriptionController.text = "";
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    title: const Text("Adicionar tarefa"),
                    content: TextField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        // hintText: "Descrição",
                        helperText: "Digite a descrição da tarefa..",
                      ),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancelar")),
                      TextButton(
                          onPressed: () {
                            addTask();
                            Navigator.pop(context);
                          },
                          child: const Text("Salvar")),
                    ],
                  );
                });
          },
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text(
                  "Listar somente as não concluídas",
                  style: TextStyle(fontSize: 16),
                ),
                Switch(
                  value: onlyUncompleted,
                  onChanged: (value) {
                    onlyUncompleted = value;
                    getTasks(onlyUncompleted);
                  },
                )
              ]),
              const Divider(),
              Expanded(
                child: ListView.builder(
                    itemCount: _tasks.length,
                    itemBuilder: (BuildContext bc, int index) {
                      Task task = _tasks[index];
                      return Dismissible(
                        key: Key(task.getId()),
                        onDismissed: (DismissDirection direction) async {
                          await taskRepository.removeTask(task.getId());
                          await getTasks(onlyUncompleted);
                        },
                        child: ListTile(
                          title: Text(task.getDescription()),
                          trailing: Switch(
                            value: task.getCompleted(),
                            onChanged: (bool value) async {
                              await taskRepository.changeTaskCompletion(
                                  task.getId(), value);
                              await getTasks(onlyUncompleted);
                            },
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }

  addTask() async {
    await taskRepository.addTask(Task(
      descriptionController.text,
      false,
    ));
    await getTasks(onlyUncompleted);
  }
}
