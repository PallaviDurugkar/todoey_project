import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoey_project/widgets/task_tile.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:todoey_project/models/task_data.dart';

// ignore: use_key_in_widget_constructors
class TasksList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskData = ref.watch(taskDataProvider);
    return ListView.builder(
      itemBuilder: (context, index) {
        final task = taskData.tasks![index];
        return TasksTile(
          isChecked: task.isDone,
          taskTitle: task.name,
          checkboxCallback: (checkboxState) {
            taskData.updateTask(task);
          },
          longPressCallback: () {
            taskData.deleteTask(task);
          },
        );
      },
      itemCount: taskData.taskCount,
    );
  }
}
