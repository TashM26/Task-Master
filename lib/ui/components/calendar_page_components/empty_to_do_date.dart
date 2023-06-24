import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task_master/generated/locale_keys.g.dart';

class EmptyToDoDate extends StatelessWidget {
  const EmptyToDoDate({
    super.key,
    required this.deviceSize,
  });

  final Size deviceSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: deviceSize.height / 5),
        const Icon(
          Icons.date_range_rounded,
          size: 80,
          color: Colors.white,
        ),
        const SizedBox(height: 10),
        Text(
          LocaleKeys.please_pick_date.tr(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        )
      ],
    );
  }
}