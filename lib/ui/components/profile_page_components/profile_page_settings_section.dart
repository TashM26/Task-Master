import 'package:flutter/material.dart';
import 'package:task_master/ui/theme/app_colors.dart';

class ProfilePageSettingSection extends StatelessWidget {
  const ProfilePageSettingSection({
    super.key,
    required this.section,
  });

  final String section;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: Row(
        children: [
          Text(
            section,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
