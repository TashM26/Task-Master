import 'package:flutter/material.dart';
import 'package:task_master/ui/theme/app_colors.dart';

class TodayDateContainer extends StatelessWidget {
  const TodayDateContainer({
    super.key,
    required this.deviceSize,
    required this.todayDateFormatted,
  });

  final Size deviceSize;
  final String todayDateFormatted;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: deviceSize.width / 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.semiDarkGrey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            todayDateFormatted,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}