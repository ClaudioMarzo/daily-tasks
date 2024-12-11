import 'package:flutter/material.dart';

class AddTaskDialog extends StatelessWidget {
  final Function(String) onAddTask;
  final TextEditingController _taskController = TextEditingController();

  AddTaskDialog({required this.onAddTask, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Task'),
      content: TextField(
        controller: _taskController,
        decoration: const InputDecoration(hintText: 'Enter task title'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            onAddTask(_taskController.text);
            _taskController.clear();
            Navigator.of(context).pop();
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
