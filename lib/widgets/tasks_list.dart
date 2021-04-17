import 'package:flutter/material.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/screens/task_tile.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.taskCount,
          itemBuilder: (context, index) {
            return TaskTile(
              taskTitle: taskData.tasks[index].name,
              isChecked: taskData.tasks[index].isDone,
              longPressCallback: () {
                taskData.deleteTask(taskData.tasks[index]);
              },
              checkboxCallback: (checkBoxState) {
                taskData.updateTask(taskData.tasks[index]);
              },
            );
          },
        );
      },
    );
  }
}
