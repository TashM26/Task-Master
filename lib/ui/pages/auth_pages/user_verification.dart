import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_master/ui/pages/auth_pages/authentication%20_transition.dart';
import 'package:task_master/ui/pages/bottom_navigation/bottom_nav_bar.dart';
import 'package:task_master/ui/pages/intro_pages/onboarding_page.dart';
import 'package:task_master/ui/theme/app_colors.dart';

class UserVerification extends StatefulWidget {
  const UserVerification({super.key});

  @override
  State<UserVerification> createState() => _UserVerificationState();
}

class _UserVerificationState extends State<UserVerification> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Bg,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const BottomNavBar();
          }
          return const AuthenticationTransition();
        },
      ),
    );
  }
}
