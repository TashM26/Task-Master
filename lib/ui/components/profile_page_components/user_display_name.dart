import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserDisplayName extends StatelessWidget {
  const UserDisplayName({
    super.key,
    required this.user,
  });

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        user?.displayName ?? 'Unknown',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
