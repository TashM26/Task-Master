import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileItems extends StatelessWidget {
  const ProfileItems({
    super.key,
    required this.iconPath,
    required this.actionName,
    required this.action,
    this.isLogoutButton = false,
  });

  final String iconPath;
  final String actionName;
  final bool isLogoutButton;
  final Function() action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: action,
        child: Row(
          children: [
            Container(
              height: 30,
              width: 30,
              color: Colors.transparent,
              child: SvgPicture.asset(iconPath),
            ),
            const SizedBox(width: 10),
            Text(
              actionName,
              style: TextStyle(
                fontSize: 16,
                color: isLogoutButton == false ? Colors.white : Colors.red,
              ),
            ),
            const Spacer(),
            isLogoutButton == false
                ? const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                  )
                : const Icon(
                    Icons.abc,
                    color: Colors.transparent,
                  )
          ],
        ),
      ),
    );
  }
}