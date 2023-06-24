import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_master/domain/router/navigation_with_transition.dart';
import 'package:task_master/generated/locale_keys.g.dart';
import 'package:task_master/ui/app.dart';
import 'package:task_master/ui/components/custom_app_bar/custom_app_bar.dart';
import 'package:task_master/ui/components/profile_page_components/profile_items.dart';
import 'package:task_master/ui/pages/bottom_navigation/bottom_nav_bar.dart';
import 'package:task_master/ui/theme/app_colors.dart';

class AppSettingPage extends StatelessWidget {
  const AppSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Bg,
      appBar: CustomAppBar(
        title: LocaleKeys.app_setting.tr(),
        isBottomBar: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  LocaleKeys.settings.tr(),
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
            ProfileItems(
              iconPath: 'assets/icons/language.svg',
              actionName: LocaleKeys.change_app_language.tr(),
              action: () {
                showModalBottomSheet(
                  backgroundColor: AppColors.Bg,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(32.0),
                    ),
                  ),
                  context: context,
                  builder: (context) => Column(
                    children: const [
                      LanguageItem(
                        language: 'Italiano',
                        languageCode: 'it',
                        languageFlag: 'italy_flag.png',
                      ),
                      LanguageItem(
                        language: 'Français',
                        languageCode: 'fr',
                        languageFlag: 'france_flag.png',
                      ),
                      LanguageItem(
                        language: 'Español',
                        languageCode: 'es',
                        languageFlag: 'spain_flag.webp',
                      ),
                      LanguageItem(
                        language: 'English',
                        languageCode: 'en',
                        languageFlag: 'uk_flag.png',
                      ),
                      LanguageItem(
                        language: 'Русский',
                        languageCode: 'ru',
                        languageFlag: 'russia_flag.png',
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageItem extends StatefulWidget {
  const LanguageItem({
    super.key,
    required this.language,
    required this.languageCode,
    required this.languageFlag,
  });
  final String language;
  final String languageCode;
  final String languageFlag;
  @override
  State<LanguageItem> createState() => _LanguageItemState();
}

class _LanguageItemState extends State<LanguageItem> {
  @override
  Widget build(BuildContext context) {
    String language_code = '${context.locale}';
    return RadioListTile(
      secondary: Container(
        height: 40,
        width: 40,
        color: Colors.transparent,
        child: Image.asset(
          'assets/flags/${widget.languageFlag}',
        ),
      ),
      title: Text(
        widget.language,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      value: widget.languageCode,
      groupValue: language_code,
      onChanged: (value) async {
        setState(() {
          language_code = widget.languageCode;
        });
        context.setLocale(Locale(language_code));
      },
    );
  }
}
