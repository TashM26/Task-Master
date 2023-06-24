import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task_master/ui/pages/auth_pages/user_verification.dart';

class TaskMaster extends StatelessWidget {
  const TaskMaster({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        unselectedWidgetColor: Colors.white,
      ),
      home: const UserVerification(),
    );
  }
}
