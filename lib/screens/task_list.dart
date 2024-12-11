import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/task_model.dart';

class TaskList extends StatelessWidget {
  final List<TaskModel> tasks;
  final Function(int) onToggle;
  final Function(int) onDelete;

  const TaskList({
    required this.tasks,
    required this.onToggle,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return ListTile(
          title: Text(
            task.title,
            style: task.isCompleted ? const TextStyle(decoration: TextDecoration.lineThrough) : null,
          ),
          leading: Checkbox(
            value: task.isCompleted,
            onChanged: (_) => onToggle(index),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () => onDelete(index),
          ),
        );
      },
    );
  }
}
