// ignore_for_file: use_build_context_synchronously, unused_element

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_master/domain/todo_service/todo_service.dart';
import 'package:task_master/generated/locale_keys.g.dart';
import 'package:task_master/ui/components/custom_app_bar/custom_app_bar.dart';
import 'package:task_master/ui/components/custom_button/custom_button.dart';
import 'package:task_master/ui/components/custom_text_field/custom_text_field.dart';
import 'package:task_master/ui/theme/app_colors.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.Bg,
      appBar: CustomAppBar(
        title: LocaleKeys.add_task.tr(),
        isBottomBar: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              controller: _titleController,
              helperText: LocaleKeys.title.tr(),
              hintText: LocaleKeys.do_math_homework.tr(),
              isHelperEnabled: true,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _descriptionController,
              helperText: LocaleKeys.description.tr(),
              hintText: LocaleKeys.do_chapter_2_to_5_for_next_week.tr(),
              isHelperEnabled: true,
            ),
            const SizedBox(height: 32),
            CustomButton(
              deviceSize: deviceSize,
              functionName: LocaleKeys.save.tr(),
              function: () => ToDoService().toDoAdd(
                context: context,
                user: user,
                titleController: _titleController,
                descriptionController: _descriptionController,
                categoryIndex: 0,
                taskPriorityIndex: 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
