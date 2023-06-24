import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_master/ui/theme/app_colors.dart';

class AppStyles {
  static InputDecoration descriptionFieldStyle = InputDecoration(
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
    hintText: 'Do chapter 2 to 5 for next week',
    hintStyle: const TextStyle(color: AppColors.grey),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 16,
    ),
  );

  static InputDecoration titleFieldStyle = InputDecoration(
    counterText: '',
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
    hintText: 'Do math homework',
    hintStyle: const TextStyle(
      color: AppColors.grey,
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 16,
    ),
  );

  InputDecoration searchFieldStyle = InputDecoration(
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
    prefixIcon: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SvgPicture.asset(
        'assets/icons/search.svg',
      ),
    ),
    hintText: 'Search for your task...',
    hintStyle: const TextStyle(
      color: AppColors.grey,
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 16,
    ),
  );
}
