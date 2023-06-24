import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_master/ui/pages/auth_pages/user_verification.dart';
import 'package:task_master/ui/pages/intro_pages/onboarding_page.dart';

class UserStatusChecker extends StatefulWidget {
  const UserStatusChecker({super.key});

  @override
  State<UserStatusChecker> createState() => _UserStatusCheckerState();
}

class _UserStatusCheckerState extends State<UserStatusChecker> {
  bool _showPage = false;

  @override
  void initState() {
    super.initState();
    // check if the page has already been shown before
    _checkPageShown();
  }

  Future<void> _checkPageShown() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool pageShown = prefs.getBool('pageShown') ?? false;
    if (!pageShown) {
      // if the page has not been shown before, set the boolean and show the page
      setState(() {
        _showPage = true;
      });
      await prefs.setBool('pageShown', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_showPage == true) {
      return const UserVerification();
    } else {
      return const OnBoardingPage();
    }
  }
}
