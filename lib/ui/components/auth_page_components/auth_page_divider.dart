import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task_master/generated/locale_keys.g.dart';
import 'package:task_master/ui/theme/app_colors.dart';

class AuthPageDivider extends StatelessWidget {
  const AuthPageDivider({
    super.key,
    required this.deviceSize,
  });

  final Size deviceSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 1,
          width: deviceSize.width / 2.5,
          color: AppColors.grey,
        ),
        Text(
          LocaleKeys.or.tr(),
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.grey,
          ),
        ),
        Container(
          height: 1,
          width: deviceSize.width / 2.5,
          color: AppColors.grey,
        ),
      ],
    );
  }
}