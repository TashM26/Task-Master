// import 'package:app_usage/app_usage.dart';
import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dnd/flutter_dnd.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:task_master/generated/locale_keys.g.dart';
import 'package:task_master/ui/components/custom_app_bar/custom_app_bar.dart';
import 'package:task_master/ui/theme/app_colors.dart';

import '../../components/focus_page_components/focus_page_body_content.dart';

class FocusPage extends StatefulWidget {
  const FocusPage({super.key});

  @override
  State<FocusPage> createState() => _FocusPageState();
}

class _FocusPageState extends State<FocusPage> {
  bool? _isGranted;
  bool _isDndOn = false;

  @override
  void initState() {
    super.initState();
    _checkAccessGranted();
  }

  void _checkAccessGranted() async {
    bool? isGranted = await FlutterDnd.isNotificationPolicyAccessGranted;
    if (isGranted != null && !isGranted) {
      FlutterDnd.gotoPolicySettings();
    }
    setState(() {
      _isGranted = isGranted ?? false;
    });
  }

  void _setDnd() async {
    if (_isDndOn == false) {
      await FlutterDnd.setInterruptionFilter(
        FlutterDnd.INTERRUPTION_FILTER_ALL,
      );
    } else {
      await FlutterDnd.setInterruptionFilter(
        FlutterDnd.INTERRUPTION_FILTER_NONE,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.Bg,
      appBar: CustomAppBar(
        title: LocaleKeys.focus_mode.tr()
      ),
      body: FocusPageBodyContent(
        deviceSize: deviceSize,
        isDndOn: _isDndOn,
        function: () {
          _setDnd();
          setState(() {
            _isDndOn = !_isDndOn;
          });
        },
      ),
    );
  }
}
