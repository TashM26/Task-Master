import 'package:flutter/material.dart';
import 'package:task_master/ui/theme/app_colors.dart';

class AlertDialogButton extends StatelessWidget {
  const AlertDialogButton({
    super.key,
    required this.deviceSize,
    this.isCancelButton = false,
    required this.functionName,
    required this.function,
  });

  final Size deviceSize;
  final bool isCancelButton;
  final String functionName;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: deviceSize.width / 3.5,
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: isCancelButton == false ? AppColors.purple : Colors.transparent,
      ),
      child: TextButton(
        onPressed: function,
        child: Text(
          functionName,
          style: TextStyle(
            color: isCancelButton == false ? Colors.white : AppColors.purple,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}