import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_master/domain/models/to_do.dart';
import 'package:task_master/domain/todo_service/todo_service.dart';
import 'package:task_master/ui/components/calendar_page_components/calendar_todo_card.dart';

class PickedToDoListView extends StatelessWidget {
  const PickedToDoListView({
    super.key,
    required this.toDoList,
  });

  final List<ToDo>? toDoList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => CalendarToDoCard(
        title: toDoList?[index].title ?? '',
        time: ToDoService().formatDate(
          toDoList?[index].dateTime ??
              DateFormat('MM.dd.yyyy HH:mm').format(
                DateTime.now(),
              ),
        ),
        categoryIndex: toDoList?[index].category ?? 10,
        taskPriority: toDoList?[index].taskPriority ?? 1,
      ),
      itemCount: toDoList?.length,
    );
  }
}
