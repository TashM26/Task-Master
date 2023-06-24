import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task_master/generated/locale_keys.g.dart';

class EmptyDocsContent extends StatelessWidget {
  const EmptyDocsContent({
    super.key,
    required this.deviceSize,
  });

  final Size deviceSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: deviceSize.height / 10),
          Image.asset('assets/images/empty_logo.png'),
          Text(
            LocaleKeys.what_do_you_want_to_do_today.tr(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            LocaleKeys.tap_to_add_your_tasks.tr(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}