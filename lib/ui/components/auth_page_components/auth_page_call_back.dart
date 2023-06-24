import 'package:flutter/material.dart';
import 'package:task_master/ui/theme/app_colors.dart';

class AuthPageCallBack extends StatelessWidget {
  const AuthPageCallBack({
    super.key,
    required this.callBack,
    required this.text,
    required this.callBackName,
  });

  final Function() callBack;
  final String text;
  final String callBackName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: AppColors.grey,
              fontSize: 12,
            ),
          ),
          GestureDetector(
            onTap: callBack,
            child: Text(
              callBackName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
