import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task_master/generated/locale_keys.g.dart';

import '../../theme/app_colors.dart';

class FocusPageBodyContent extends StatelessWidget {
  final Size deviceSize;
  final bool isDndOn;
  final Function() function;
  const FocusPageBodyContent({
    super.key,
    required this.deviceSize,
    required this.isDndOn,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          isDndOn == false
              ? Icons.notifications_off_rounded
              : Icons.notifications_active_rounded,
          color: Colors.white,
          size: 96,
        ),
        SizedBox(
          height: deviceSize.height / 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            LocaleKeys.while_your_focus_mode.tr(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: deviceSize.height / 40),
        GestureDetector(
          onTap: function,
          child: Container(
            height: 48,
            width: deviceSize.width / 2.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.purple,
            ),
            child: Center(
              child: Text(
                isDndOn == true ? LocaleKeys.start_focusing.tr() : LocaleKeys.stop_focusing.tr(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}