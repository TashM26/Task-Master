import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_master/generated/locale_keys.g.dart';
import 'package:task_master/ui/pages/intro_pages/start_page.dart';
import 'package:task_master/ui/pages/main_pages/add_page.dart';
import 'package:task_master/ui/pages/main_pages/calendar_page.dart';
import 'package:task_master/ui/pages/main_pages/focus_page.dart';
import 'package:task_master/ui/pages/main_pages/home_page.dart';
import 'package:task_master/ui/pages/main_pages/profile_page.dart';
import 'package:task_master/ui/theme/app_colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Bg,
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.purple,
        elevation: 0,
        splashColor: Colors.transparent,
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 300),
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const AddPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(
                opacity: animation,
                child: child,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: AppColors.darkGrey,
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ! LEFT SIDE OF BOTTOM ICONS
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 200,
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: CustomBottomBarButton(
                              pageName: LocaleKeys.home.tr(),
                              iconPath: _currentIndex == 0
                                  ? 'assets/icons/fill_home.svg'
                                  : 'assets/icons/home.svg',
                              function: () {
                                setState(() {
                                  currentScreen = const HomePage();
                                  _currentIndex = 0;
                                });
                              },
                            )
                            
                            ),
                        CustomBottomBarButton(
                          pageName: LocaleKeys.focus.tr(),
                          iconPath: _currentIndex == 1
                              ? 'assets/icons/fill_calendar.svg'
                              : 'assets/icons/calendar.svg',
                          function: () {
                            setState(() {
                              currentScreen = const CalendarPage();
                              _currentIndex = 1;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
              // ! RIGHT SIDE OF BOTTOM ICONS
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 200,
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomBottomBarButton(
                          pageName: LocaleKeys.focus.tr(),
                          iconPath: _currentIndex == 2
                              ? 'assets/icons/fill_focus.svg'
                              : 'assets/icons/focus.svg',
                          function: () {
                            setState(() {
                              currentScreen = const FocusPage();
                              _currentIndex = 2;
                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: CustomBottomBarButton(
                            pageName: LocaleKeys.profile.tr(),
                            iconPath: _currentIndex == 3
                                ? 'assets/icons/fill_profile.svg'
                                : 'assets/icons/profile.svg',
                            function: () {
                              setState(() {
                                currentScreen = const ProfilePage();
                                _currentIndex = 3;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
                // ! RIGHT SIDE OF BOTTOM ICONS
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBottomBarButton extends StatelessWidget {
  const CustomBottomBarButton({
    super.key,
    required this.pageName,
    required this.iconPath,
    required this.function,
  });

  @override
  final String pageName;
  final String iconPath;
  final Function() function;

  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      minWidth: 40,
      onPressed: function,
      // () {
      // setState(() {
      //   currentScreen = const ProfilePage();
      //   _currentIndex = 3;
      // });
      // },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(iconPath
              // _currentIndex == 3
              //     ? 'assets/icons/fill_profile.svg'
              //     : 'assets/icons/profile.svg',
              ),
          const SizedBox(height: 5),
          Text(
            pageName,
            // LocaleKeys.profile.tr(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
