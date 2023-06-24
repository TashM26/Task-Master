import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_master/domain/service/account_service/account_service.dart';
import 'package:task_master/generated/locale_keys.g.dart';
import 'package:task_master/ui/components/custom_alert_dialog/alert_dialog_button.dart';
import 'package:task_master/ui/components/custom_alert_dialog/custom_alert_dialog.dart';
import 'package:task_master/ui/components/custom_app_bar/custom_app_bar.dart';
import 'package:task_master/ui/components/custom_text_field/custom_text_field.dart';
import 'package:task_master/ui/components/profile_page_components/profile_items.dart';
import 'package:task_master/ui/components/profile_page_components/profile_page_settings_section.dart';
import 'package:task_master/ui/components/profile_page_components/profile_page_task_counter.dart';
import 'package:task_master/ui/components/profile_page_components/user_display_name.dart';
import 'package:task_master/ui/components/user_avatar/user_avatar.dart';
import 'package:task_master/ui/pages/app_setting_page/app_settings.dart';
import 'package:task_master/ui/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../domain/router/navigation_with_transition.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser;
  final String aboutUsUrl =
      'https://play.google.com/store/search?q=pub%3A%20Tash%20Dev&c=apps&hl=ru&gl=US';
  final String supportUs = 'https://www.buymeacoffee.com/tashdevteam';
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  Uri emailSend = Uri(
    scheme: 'mailto',
    path: 'tashdevteam@gmail.com',
  );
  final sortDateTime = DateFormat('MM.dd.yyyy').format(DateTime.now());
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.Bg,
      appBar: CustomAppBar(
        title: LocaleKeys.profile.tr(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: <Widget>[
                // Circle Avatar
                UserAvatar(
                  user: user,
                  deviceSize: deviceSize,
                  isProfilePage: true,
                ),

                // User Display Name (Username)
                UserDisplayName(user: user),

                // Task Counter Row
                ProfilePageTaskCounter(
                  deviceSize: deviceSize,
                  user: user,
                ),

                // Setting Section
                ProfilePageSettingSection(section: LocaleKeys.settings.tr()),
                ProfileItems(
                  iconPath: 'assets/icons/settings.svg',
                  actionName: LocaleKeys.app_setting.tr(),
                  action: () => navigationWithTransition(
                    context,
                    const AppSettingPage(),
                  ),
                ),
                const SizedBox(height: 10),

                // Account Section
                ProfilePageSettingSection(section: LocaleKeys.account.tr()),
                ProfileItems(
                  iconPath: 'assets/icons/account.svg',
                  actionName: LocaleKeys.change_account_name.tr(),
                  action: () {
                    showDialog(
                      context: context,
                      builder: (context) => CustomAlertDialog(
                        deviceSize: deviceSize,
                        alertTitle: LocaleKeys.change_username.tr(),
                        widget: CustomTextField(
                          controller: _usernameController,
                          hintText: '${user?.displayName}',
                          isHelperEnabled: false,
                        ),
                        buttonsRow: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AlertDialogButton(
                              deviceSize: deviceSize,
                              functionName: LocaleKeys.cancel.tr(),
                              isCancelButton: true,
                              function: () => Navigator.of(context).pop(),
                            ),
                            AlertDialogButton(
                              deviceSize: deviceSize,
                              functionName: LocaleKeys.edit.tr(),
                              function: () => AccountService()
                                  .changeUsername(_usernameController),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                ProfileItems(
                  iconPath: 'assets/icons/password.svg',
                  actionName: LocaleKeys.change_account_password.tr(),
                  action: () {
                    showDialog(
                      context: context,
                      builder: (context) => CustomAlertDialog(
                        deviceSize: deviceSize,
                        alertTitle: LocaleKeys.change_password.tr(),
                        widget: Text(
                          '${LocaleKeys.we_will_send_you_password.tr()} (${user?.email})',
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white54),
                        ),
                        buttonsRow: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AlertDialogButton(
                              deviceSize: deviceSize,
                              functionName: LocaleKeys.cancel.tr(),
                              isCancelButton: true,
                              function: () => Navigator.of(context).pop(),
                            ),
                            AlertDialogButton(
                              deviceSize: deviceSize,
                              functionName: LocaleKeys.edit.tr(),
                              function: () =>
                                  AccountService().sendResetPasswordEmail(user),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                ProfileItems(
                  iconPath: 'assets/icons/image.svg',
                  actionName: LocaleKeys.change_account_image.tr(),
                  action: () {
                    AccountService().updateAccountPhoto(context, user);
                  },
                ),

                // Task Master Section
                const SizedBox(height: 10),
                ProfilePageSettingSection(section: LocaleKeys.task_master.tr()),
                ProfileItems(
                  iconPath: 'assets/icons/about.svg',
                  actionName: LocaleKeys.about_us.tr(),
                  action: () {
                    launchUrlString(aboutUsUrl);
                  },
                ),
                ProfileItems(
                  iconPath: 'assets/icons/help.svg',
                  actionName: LocaleKeys.help_feedback.tr(),
                  action: () {
                    launchUrl(emailSend);
                  },
                ),
                ProfileItems(
                  iconPath: 'assets/icons/support.svg',
                  actionName: LocaleKeys.support_us.tr(),
                  action: () {
                    launchUrlString(supportUs);
                  },
                ),
                ProfileItems(
                  iconPath: 'assets/icons/logout.svg',
                  actionName: LocaleKeys.logout.tr(),
                  isLogoutButton: true,
                  action: () {
                    FirebaseAuth.instance.signOut();
                  },
                ),
                SizedBox(height: deviceSize.height / 15)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
