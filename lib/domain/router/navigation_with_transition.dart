import 'package:flutter/material.dart';

void navigationWithTransition(BuildContext context, Widget page) {
  Navigator.push(
    context,
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: animation,
        child: child,
      ),
    ),
  );
}

void navigationWithTransitionAndRemove(BuildContext context, Widget page) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => page,
    ),
    // PageRouteBuilder(
    //   transitionDuration: const Duration(milliseconds: 300),
    //   pageBuilder: (context, animation, secondaryAnimation) => page,
    //   transitionsBuilder: (context, animation, secondaryAnimation, child) =>
    //       FadeTransition(
    //     opacity: animation,
    //     child: child,
    //   ),
    // ),
    (route) => false,
  );
}
