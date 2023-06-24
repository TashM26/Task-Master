import 'package:flutter/material.dart';
import 'package:task_master/ui/theme/app_colors.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.deviceSize,
    required this.alertTitle,
    required this.buttonsRow,
    this.controller,
    required this.widget,
  });
  final Size deviceSize;
  final String alertTitle;
  final TextEditingController? controller;
  final Widget buttonsRow;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.darkGrey,
      title: Center(
        child: Text(
          alertTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      content: Container(
        height: 160,
        width: 200,
        color: AppColors.darkGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget,
            const SizedBox(height: 10),
            buttonsRow
          ],
        ),
      ),
    );
  }
}