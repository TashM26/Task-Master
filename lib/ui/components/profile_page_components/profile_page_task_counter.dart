import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_master/domain/models/to_do.dart';
import 'package:task_master/generated/locale_keys.g.dart';
import 'package:task_master/ui/theme/app_colors.dart';

class ProfilePageTaskCounter extends StatefulWidget {
  final User? user;
  final Size deviceSize;
  const ProfilePageTaskCounter({
    super.key,
    this.user,
    required this.deviceSize,
  });

  @override
  State<ProfilePageTaskCounter> createState() => _ProfilePageTaskCounterState();
}

class _ProfilePageTaskCounterState extends State<ProfilePageTaskCounter> {
  final sortDateTime = DateFormat('MM.dd.yyyy').format(DateTime.now());
  int taskLeft = 0;
  int taskDone = 0;

  taskCounter(List<ToDo> toDoList) {
    taskDone = 0;
    taskLeft = 0;
    toDoList.forEach((element) {
      if (element.completed == true) {
        taskDone++;
      } else {
        taskLeft++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('${widget.user?.uid} TO-DO\'S')
          .where('sortDateTime', isEqualTo: sortDateTime)
          .snapshots(),
      builder: (context, snapshot) {
        final getToDoS = snapshot.data?.docs;

        final toDoList = getToDoS
            ?.map(
              (transaction) => ToDo.fromJson(
                transaction.data(),
              ),
            )
            .toList();
        taskCounter(toDoList ?? []);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 58,
                width: widget.deviceSize.width / 2.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.darkGrey,
                ),
                child: Center(
                  child: Text(
                    '$taskLeft ${LocaleKeys.task_left.tr()}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Container(
                height: 58,
                width: widget.deviceSize.width / 2.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.darkGrey,
                ),
                child: Center(
                  child: Text(
                    '$taskDone ${LocaleKeys.task_done.tr()}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}