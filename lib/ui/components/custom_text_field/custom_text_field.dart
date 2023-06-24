import 'package:flutter/material.dart';
import 'package:task_master/ui/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.helperText = '',
    this.isHelperEnabled = true,
  });

  final TextEditingController controller;
  final String hintText;
  final String helperText;
  final bool isHelperEnabled;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        isHelperEnabled == true
            ? Text(
                helperText,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              )
            : Container() ,
        const SizedBox(height: 8),
        TextField(
          style: const TextStyle(color: Colors.white),
          controller: controller,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: AppColors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.purple,
              ),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(color: AppColors.grey),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 16,
            ),
          ),
        ),
      ],
    );
  }
}