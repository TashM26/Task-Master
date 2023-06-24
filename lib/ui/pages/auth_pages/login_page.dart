// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task_master/domain/service/auth_service/auth_service.dart';
import 'package:task_master/generated/locale_keys.g.dart';
import 'package:task_master/ui/components/auth_page_components/auth_page_call_back.dart';
import 'package:task_master/ui/components/auth_page_components/auth_page_divider.dart';
import 'package:task_master/ui/components/auth_page_components/auth_page_media_button.dart';
import 'package:task_master/ui/components/auth_page_components/auth_page_title.dart';
import 'package:task_master/ui/components/custom_button/custom_button.dart';
import 'package:task_master/ui/components/custom_text_field/custom_text_field.dart';
import 'package:task_master/ui/theme/app_colors.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({
    super.key,
    required this.showRegisterPage,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.Bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: deviceSize.width * 0.05,
              vertical: deviceSize.height * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                AuthPageTitle(title: LocaleKeys.login.tr()),
                const SizedBox(height: 40),

                // Email TextField
                CustomTextField(
                  controller: _emailController,
                  hintText: LocaleKeys.enter_your_email.tr(),
                  helperText: LocaleKeys.email.tr(),
                  isHelperEnabled: true,
                ),
                const SizedBox(height: 16),

                // Password TextField
                CustomTextField(
                  controller: _passwordController,
                  hintText: LocaleKeys.password.tr(),
                  helperText: LocaleKeys.enter_your_password.tr(),
                  isHelperEnabled: true,
                ),
                const SizedBox(height: 24),

                // Login Button
                CustomButton(
                  deviceSize: deviceSize,
                  functionName: LocaleKeys.login.tr(),
                  function: () => AuthService().loginWithEmail(
                    context: context,
                    emailController: _emailController,
                    passwordController: _passwordController,
                  ),
                ),
                const SizedBox(height: 24),

                // Custom Divider
                AuthPageDivider(deviceSize: deviceSize),
                const SizedBox(height: 16),

                // Social Media Login
                AuthPageMediaButton(
                  functionName: '${LocaleKeys.login_with.tr()} Google',
                  mediaAsset: 'assets/logos/google_logo.png',
                  function: () => AuthService().loginWithGoogle(context),
                  deviceSize: deviceSize,
                ),

                // Social Media Login
                AuthPageMediaButton(
                  functionName: '${LocaleKeys.login_with.tr()} Facebook',
                  mediaAsset: 'assets/logos/facebook_logo.png',
                  deviceSize: deviceSize,
                  function: () => AuthService().loginWithFacebook(),
                ),
                const SizedBox(height: 24),

                // Login & Register page transition (callback)
                AuthPageCallBack(
                  text: LocaleKeys.dont_have_account.tr(),
                  callBackName: ' ${LocaleKeys.register.tr()}',
                  callBack: widget.showRegisterPage,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
