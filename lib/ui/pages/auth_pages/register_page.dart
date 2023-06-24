// ignore_for_file: unused_field, non_constant_identifier_names, use_build_context_synchronously

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

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({
    super.key,
    required this.showLoginPage,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
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
                AuthPageTitle(title: LocaleKeys.register.tr()),
                const SizedBox(height: 40),

                // Username TextField
                CustomTextField(
                  controller: _usernameController,
                  hintText: LocaleKeys.enter_your_username.tr(),
                  helperText: LocaleKeys.username.tr(),
                  isHelperEnabled: true,
                ),
                const SizedBox(height: 16),

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
                  hintText: LocaleKeys.enter_your_password.tr(),
                  helperText: LocaleKeys.password.tr(),
                  isHelperEnabled: true,
                ),
                const SizedBox(height: 24),

                // Register Button
                CustomButton(
                  deviceSize: deviceSize,
                  functionName: LocaleKeys.register.tr(),
                  function: () => AuthService().registerWithEmail(
                    context: context,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    usernameController: _usernameController,
                  ),
                ),
                const SizedBox(height: 24),

                // Custom Divider
                AuthPageDivider(deviceSize: deviceSize),
                const SizedBox(height: 16),

                // Social Media Button
                AuthPageMediaButton(
                  deviceSize: deviceSize,
                  functionName: '${LocaleKeys.register_with.tr()} Google',
                  mediaAsset: 'assets/logos/google_logo.png',
                  function: () => AuthService().loginWithGoogle(context),
                ),

                // Social Media Button
                AuthPageMediaButton(
                  functionName: '${LocaleKeys.register_with.tr()} Facebook',
                  mediaAsset: 'assets/logos/facebook_logo.png',
                  deviceSize: deviceSize,
                  function: () => AuthService().loginWithFacebook(),
                ),
                const SizedBox(height: 24),

                // Login & Register page transition (callback)
                AuthPageCallBack(
                  text: LocaleKeys.already_have_an_account.tr(),
                  callBackName: ' ${LocaleKeys.login.tr()}',
                  callBack: widget.showLoginPage,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
