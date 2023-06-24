import 'package:flutter/material.dart';
import 'package:task_master/ui/theme/app_colors.dart';

class SecondOnboardingPage extends StatelessWidget {
  const SecondOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      color: AppColors.Bg,
      child: Column(
        children: [
          SizedBox(height: deviceSize.height / 8),
          Image.asset(
            'assets/images/onboarding_two.png',
            height: deviceSize.height / 3,
            width: deviceSize.width,
          ),
          SizedBox(height: deviceSize.height / 7),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Create daily routine',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: deviceSize.height / 50),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'In Task Master, you can create your personalized routine to stay productive',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
