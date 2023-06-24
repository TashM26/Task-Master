import 'package:flutter/material.dart';
import 'package:task_master/ui/theme/app_colors.dart';

class AuthPageMediaButton extends StatelessWidget {
  const AuthPageMediaButton({
    super.key,
    required this.deviceSize,
    required this.functionName,
    required this.mediaAsset,
    required this.function,
  });

  final Size deviceSize;
  final String functionName;
  final String mediaAsset;
  final Function() function;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        width: double.infinity,
        height: deviceSize.height * 0.06,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.transparent,
          border: Border.all(
            color: AppColors.purple,
            width: 2,
          ),
        ),
        child: TextButton(
          onPressed: function,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: deviceSize.height * 0.04,
                width: deviceSize.width * 0.07,
                color: Colors.transparent,
                child: Image.asset(mediaAsset),
              ),
              const SizedBox(width: 10),
              Text(
                functionName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}