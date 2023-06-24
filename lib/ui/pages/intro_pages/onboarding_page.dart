// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_master/ui/components/onboarding/first_onboarding_page.dart';
import 'package:task_master/ui/components/onboarding/second_onboarding_page.dart';
import 'package:task_master/ui/components/onboarding/third_onboarding_page.dart';
import 'package:task_master/ui/pages/intro_pages/start_page.dart';
import 'package:task_master/ui/theme/app_colors.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  PageController _pageController = PageController();
  bool OnLastPage = false;

  @override
  void initState() {
    super.initState();
    // checkIfUserIsNew();
  }

  void checkIfUserIsNew() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isNewUser = prefs.getBool('isNewUser');

    if (isNewUser == null || isNewUser) {
      prefs.setBool('isNewUser', false);
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const StartPage()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PAGE VIEW

          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                OnLastPage = (index == 2);
              });
            },
            children: const [
              FirstOnboardingPage(),
              SecondOnboardingPage(),
              ThirdOnboardingPage(),
            ],
          ),
          // DOT INDICATOR CONTAINER
          Container(
            alignment: const Alignment(0, 0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // dot indicators
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    dotColor: AppColors.grey,
                    activeDotColor: AppColors.purple,
                  ),
                ),
              ],
            ),
          ),
          // NEXT & SKIP CONTAINER
          Container(
            alignment: const Alignment(0, 0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // skip

                GestureDetector(
                  onTap: () {
                    _pageController.jumpToPage(2);
                  },
                  child: Container(
                    height: 48,
                    width: 90,
                    color: Colors.transparent,
                    child: const Center(
                      child: Text(
                        'SKIP',
                        style: TextStyle(
                          color: AppColors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),

                // next & done
                OnLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const StartPage(),
                            ),
                          );
                        },
                        child: Container(
                          height: 48,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.purple,
                          ),
                          child: const Center(
                            child: Text(
                              'GET STARTED',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Container(
                          height: 48,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.purple,
                          ),
                          child: const Center(
                            child: Text(
                              'NEXT',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
