import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_master/generated/locale_keys.g.dart';
import 'package:task_master/ui/theme/app_colors.dart';

class ToDoService {
  toDoAdd({
    required BuildContext context,
    required User? user,
    required TextEditingController titleController,
    required TextEditingController descriptionController,
    required int categoryIndex,
    required int taskPriorityIndex,
  }) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: AppColors.purple,
        ),
      ),
    );
    try {
      await FirebaseFirestore.instance.collection('${user?.uid} TO-DO\'S').add({
        'title': titleController.text.trim(),
        'description': descriptionController.text.trim(),
        'category': categoryIndex,
        'taskPriority': taskPriorityIndex + 1,
        'completed': false,
        'dateTime': DateFormat('MM.dd.yyyy HH:mm').format(DateTime.now()),
        'sortDateTime': DateFormat('MM.dd.yyyy').format(DateTime.now()),
      });
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    } catch (e) {
      print('ERROR IS $e');
    }
  }

  getDocId({
    required User? user,
    required List docIDs,
  }) async {
    await FirebaseFirestore.instance
        .collection('${user?.uid} TO-DO\'S')
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              docIDs.add(
                document.reference.id,
              );
            },
          ),
        );
  }

  String formatDate(String dateString) {
    final DateFormat dateFormat = DateFormat('MM.dd.yyyy HH:mm');
    final date = dateFormat.parse(dateString);
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('h:mm');

    if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day) {
      // Today
      return '${LocaleKeys.today_at.tr()} ${formatter.format(date)}';
    } else if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day - 1) {
      // Yesterday
      return '${LocaleKeys.yesterday_at.tr()} ${formatter.format(date)}';
    } else {
      // Use the full date if it's not today or yesterday
      final DateFormat formatter = DateFormat('MMM dd, yyyy h:mm a');
      return formatter.format(date);
    }
  }
}
