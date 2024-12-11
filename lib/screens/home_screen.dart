import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/add_list.dart';
import 'package:flutter_application_1/models/task_model.dart';
import 'package:flutter_application_1/screens/task_list.dart';
import 'package:flutter_application_1/controller/task_controller.dart';

class HomeScreen extends StatelessWidget {
  final TaskController taskProvider = TaskController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: ValueListenableBuilder<List<TaskModel>>(
        valueListenable: taskProvider,
        builder: (context, tasks, child) {
          final completedTasks = tasks.where((task) => task.isCompleted).toList();
          final pendingTasks = tasks.where((task) => !task.isCompleted).toList();

          List<Widget> children = [
            Expanded(
              child: TaskList(
                tasks: pendingTasks,
                onToggle: (index) => taskProvider.toggleTask(index),
                onDelete: (index) => taskProvider.deleteTask(index),
              ),
            ),
          ];

          if (completedTasks.isNotEmpty) {
            children.addAll([
              const Divider(),
              const Text(
                'Completed Tasks',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: TaskList(
                  tasks: completedTasks,
                  onToggle: (index) => taskProvider.toggleTask(index),
                  onDelete: (index) => taskProvider.deleteTask(index),
                ),
              ),
            ]);
          }

          return Column(children: children);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddTaskDialog(
            onAddTask: (title) => taskProvider.addTask(title),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
