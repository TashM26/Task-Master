import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_master/ui/theme/app_colors.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.user,
    required this.deviceSize,
    required this.isProfilePage,
  });

  final User? user;
  final Size deviceSize;
  final bool isProfilePage;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: isProfilePage == false ? 21 : 60,
      backgroundColor: AppColors.semiDarkGrey,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: user?.photoURL != null
            ? Image.network(
                user!.photoURL!,
                fit: BoxFit.cover,
              )
            : Icon(
                Icons.account_circle_rounded,
                size: isProfilePage == false ? 40 : 120,
              ),
      ),
    );
  }
}
