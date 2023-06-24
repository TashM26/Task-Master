import 'package:flutter/material.dart';
import 'package:task_master/ui/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.deviceSize,
    required this.functionName,
    required this.function,
  });

  final Size deviceSize;
  final String functionName;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: deviceSize.height * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.purple,
      ),
      child: TextButton(
        onPressed: function,
        child: Center(
          child: Text(
            functionName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
