import 'package:flutter/material.dart';
import 'package:task_master/ui/pages/auth_pages/login_page.dart';
import 'package:task_master/ui/pages/auth_pages/register_page.dart';

class AuthenticationTransition extends StatefulWidget {
  const AuthenticationTransition({super.key});

  @override
  State<AuthenticationTransition> createState() =>
      _AuthenticationTransitionState();
}

class _AuthenticationTransitionState extends State<AuthenticationTransition> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showRegisterPage: togglePages);
    } else {
      return RegisterPage(showLoginPage: togglePages);
    }
  }
}
