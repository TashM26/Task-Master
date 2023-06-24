import 'package:flutter/material.dart';
import 'package:task_master/domain/models/to_do.dart';
import 'package:task_master/domain/todo_service/todo_service.dart';
import 'package:task_master/ui/components/home_page_components/todo_card.dart';

class ToDosListView extends StatelessWidget {
  const ToDosListView({
    super.key,
    required this.docIDs,
    required this.toDoList,
  });

  final List<String> docIDs;
  final List<ToDo>? toDoList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onLongPress: () {
            // Navigator.push(
            //   context,
            //   PageRouteBuilder(
            //     settings: RouteSettings(arguments: index),
            //     transitionDuration: const Duration(milliseconds: 300),
            //     pageBuilder: (context, animation, secondaryAnimation) =>
            //         const ToDoMoreInfoPage(),
            //     transitionsBuilder:
            //         (context, animation, secondaryAnimation, child) =>
            //             FadeTransition(
            //       opacity: animation,
            //       child: child,
            //     ),
            //   ),
            // );
          },
          child: ToDoCard(
            docIDs: docIDs[index],
            title: toDoList?[index].title ?? '',
            time: ToDoService().formatDate(
              toDoList?[index].dateTime ?? '04.24.2023',
            ),
            categoryIndex: toDoList?[index].category ?? 10,
            taskPriority: toDoList?[index].taskPriority ?? 1,
            completed: toDoList?[index].completed ?? false,
          ),
        );
      },
      itemCount: toDoList?.length,
    );
  }
}