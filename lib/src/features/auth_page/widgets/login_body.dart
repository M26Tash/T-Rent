import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/localization/localizations_ext.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/utils/validators/auth_validators.dart';
import 'package:t_rent/src/common/widgets/custom_button/custom_button.dart';
import 'package:t_rent/src/common/widgets/input_field/input_field.dart';
import 'package:t_rent/src/features/auth_page/cubit/auth_cubit.dart';

class LoginBody extends StatefulWidget {
  final AuthCubit authCubit;

  const LoginBody({
    required this.authCubit,
    super.key,
  });

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  late final AuthValidators _authValidators;

  late final GlobalKey<FormState> _emailFormKey;
  late final GlobalKey<FormState> _passwordFormKey;

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();

    _authValidators = AuthValidators(context);

    _emailFormKey = GlobalKey<FormState>();
    _passwordFormKey = GlobalKey<FormState>();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimensions.extraLarge,
        horizontal: AppDimensions.large,
      ),
      children: [
        Text(
          context.locale.welcomeBack,
          style: context.themeData.textTheme.displayLarge?.copyWith(
            fontSize: AppFonts.sizeDisplayPreLarge,
            color: context.theme.primaryTextColor,
            fontWeight: AppFonts.weightSemiBold,
          ),
        ),
        Text(
          context.locale.pleaseLoginToYourAccount,
          style: context.themeData.textTheme.headlineSmall?.copyWith(
            color: context.theme.secondaryTextColor,
            fontWeight: AppFonts.weightRegular,
          ),
        ),
        const SizedBox(height: AppDimensions.extraLarge),
        InputField(
          formKey: _emailFormKey,
          controller: _emailController,
          fieldTitle: context.locale.emailAddress,
          hintText: 'abc@test.com',
          validator: (email) => _authValidators.validateEmail(email!),
        ),
        const SizedBox(height: AppDimensions.large),
        InputField(
          formKey: _passwordFormKey,
          controller: _passwordController,
          fieldTitle: context.locale.password,
          hintText: '********',
          validator: (passwd) => _authValidators.validatePassword(passwd!),
        ),
        const SizedBox(height: AppDimensions.large),
        InkWell(
          onTap: widget.authCubit.navigateToForgotPassword,
          child: Text(
            context.locale.forgotPasswordQ,
            style: context.themeData.textTheme.headlineSmall?.copyWith(
              fontWeight: AppFonts.weightRegular,
              color: context.theme.accentTextColor,
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.large),
        CustomButton(
          buttonText: context.locale.login,
          onTap: () {
            final emailValidate = _emailFormKey.currentState?.validate();
            final passwordValidate = _passwordFormKey.currentState?.validate();

            if (emailValidate! && passwordValidate!) {}
          },
        ),
        const SizedBox(height: AppDimensions.large),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: context.locale.dontHaveAnAccount,
                style: context.themeData.textTheme.headlineSmall?.copyWith(
                  color: context.theme.secondaryTextColor,
                  fontWeight: AppFonts.weightRegular,
                ),
              ),
              const WidgetSpan(
                child: SizedBox(
                  width: AppDimensions.medium,
                ),
              ),
              TextSpan(
                text: context.locale.register,
                style: context.themeData.textTheme.headlineSmall?.copyWith(
                  color: context.theme.accentTextColor,
                  fontWeight: AppFonts.weightRegular,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = widget.authCubit.toggleAuthStep,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
