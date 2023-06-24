import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_master/domain/models/to_do.dart';
import 'package:task_master/ui/components/home_page_components/empty_docs_content.dart';
import 'package:task_master/ui/components/home_page_components/to_dos_list_view.dart';
import 'package:task_master/ui/components/home_page_components/today_date_container.dart';

class ToDosStreamBuilder extends StatelessWidget {
  const ToDosStreamBuilder({
    super.key,
    required this.user,
    required this.todayDate,
    required this.deviceSize,
    required this.todayDateFormatted,
    required this.docIDs,
  });

  final User? user;
  final String todayDate;
  final Size deviceSize;
  final String todayDateFormatted;
  final List<String> docIDs;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('${user?.uid} TO-DO\'S')
          .where('sortDateTime', isEqualTo: todayDate)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.transparent,
            ),
          );
        }
        if (snapshot.data!.docs.isEmpty) {
          return EmptyDocsContent(deviceSize: deviceSize);
        }

        final getToDoS = snapshot.data?.docs;
        final toDoList = getToDoS
            ?.map(
              (transaction) => ToDo.fromJson(
                transaction.data(),
              ),
            )
            .toList();
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 32,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TodayDateContainer(
                  deviceSize: deviceSize,
                  todayDateFormatted: todayDateFormatted,
                ),
                ToDosListView(docIDs: docIDs, toDoList: toDoList)
              ],
            ),
          ),
        );
      },
    );
  }
}