// ignore_for_file: deprecated_member_use, prefer_is_empty, avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_master/domain/models/to_do.dart';
import 'package:task_master/generated/locale_keys.g.dart';
import 'package:task_master/ui/components/custom_app_bar/custom_app_bar.dart';
import 'package:task_master/ui/components/home_page_components/empty_docs_content.dart';
import 'package:task_master/ui/components/home_page_components/to_dos_stream_builder.dart';
import 'package:task_master/ui/components/user_avatar/user_avatar.dart';
import 'package:task_master/ui/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  String todayDate = DateFormat('MM.dd.yyyy').format(DateTime.now()).toString();
  String todayDateFormatted =
      DateFormat('MMM dd , yyyy').format(DateTime.now()).toString();
  List<String> docIDs = [];
  List<ToDo> toDoList = [];

  @override
  void initState() {
    getDocId();
    super.initState();
  }

  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('${user?.uid} TO-DO\'S')
        .where('sortDateTime', isEqualTo: todayDate)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              docIDs.add(document.reference.id);
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.Bg,
      appBar: CustomAppBar(
        title: LocaleKeys.home.tr(),
        isHomePage: true,
      ),
      body: FutureBuilder(
        future: getDocId(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.purple,
              ),
            );
          }
          if (docIDs.isEmpty) {
            return EmptyDocsContent(
              deviceSize: deviceSize,
            );
          }
          return ToDosStreamBuilder(
            user: user,
            todayDate: todayDate,
            deviceSize: deviceSize,
            todayDateFormatted: todayDateFormatted,
            docIDs: docIDs,
          );
        },
      ),
    );
  }
}
