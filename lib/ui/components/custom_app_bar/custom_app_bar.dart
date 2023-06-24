import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../user_avatar/user_avatar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.isBottomBar = true,
    this.isHomePage = false,
  });

  final String title;
  final bool isBottomBar;
  final bool isHomePage;
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final deviceSize = MediaQuery.of(context).size;
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      leading: isBottomBar == false
          ? IconButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            )
          : IconButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.transparent,
              ),
            ),
      actions: [
        isHomePage == false
            ? const Icon(
                Icons.abc,
                color: Colors.transparent,
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: UserAvatar(
                  user: user,
                  deviceSize: deviceSize,
                  isProfilePage: false,
                ),
              ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
