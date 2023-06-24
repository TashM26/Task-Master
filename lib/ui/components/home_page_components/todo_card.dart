import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_master/ui/theme/app_colors.dart';

class ToDoCard extends StatefulWidget {
  const ToDoCard({
    super.key,
    required this.title,
    required this.time,
    required this.categoryIndex,
    required this.taskPriority,
    required this.completed,
    required this.docIDs,
  });

  final String title;
  final String time;
  final int categoryIndex;
  final int taskPriority;
  final bool completed;
  final String docIDs;
  @override
  State<ToDoCard> createState() => _ToDoCardState();
}

class _ToDoCardState extends State<ToDoCard> {
  bool _completed = false;
  final user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    _completed = widget.completed;
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 80,
        width: deviceSize.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: AppColors.darkGrey,
        ),
        child: Row(
          children: [
            Checkbox(
              onChanged: (value) {
                setState(() {
                  _completed = value!;
                });
                // Update the value in Firebase
                FirebaseFirestore.instance
                    .collection('${user?.uid} TO-DO\'S')
                    .doc(widget.docIDs)
                    .update(
                  {
                    'completed': value,
                  },
                );
              },
              value: _completed,
              activeColor: AppColors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.time,
                  style: const TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
