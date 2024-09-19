import 'package:dio_flutter_study/models/task.dart';

class TaskRepository {
  final List<Task> _tasks = [];

  Future<List<Task>> getTasks() async {
    await Future.delayed(const Duration(milliseconds: 200)); //Simulation
    return _tasks;
  }

  Future<List<Task>> getTasksIncomplete() async {
    await Future.delayed(const Duration(milliseconds: 200)); //Simulation
    return _tasks
        .where(
          (task) => task.getCompleted() == false,
        )
        .toList();
  }

  Future<void> addTask(Task task) async {
    await Future.delayed(const Duration(milliseconds: 200)); //Simulation
    _tasks.add(task);
  }

  Future<void> changeTaskCompletion(String id, bool completed) async {
    await Future.delayed(const Duration(milliseconds: 200)); //Simulation
    _tasks
        .where(
          (task) => task.getId() == id,
        )
        .first
        .setCompleted(completed);
  }

  Future<void> removeTask(String id) async {
    await Future.delayed(const Duration(milliseconds: 200)); //Simulation
    _tasks.remove(_tasks.where((task) => task.getId() == id).first);
  }
}
