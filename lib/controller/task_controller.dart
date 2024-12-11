import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/task_model.dart';

class TaskController extends ValueNotifier<List<TaskModel>> {
  TaskController() : super([]);

  void addTask(String title) {
    final updatedTasks = List<TaskModel>.from(value);
    updatedTasks.add(TaskModel(title: title));
    value = updatedTasks;
  }

  void toggleTask(int index) {
    final updatedTasks = List<TaskModel>.from(value);
    updatedTasks[index].isCompleted = !updatedTasks[index].isCompleted;
    value = updatedTasks;
  }

  void deleteTask(int index) {
    final updatedTasks = List<TaskModel>.from(value);
    updatedTasks.removeAt(index);
    value = updatedTasks;
  }
}
