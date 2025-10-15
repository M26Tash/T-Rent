// ignore_for_file: unnecessary_lambdas

import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/localization/localizations_ext.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/widgets/custom_button/custom_button.dart';
import 'package:t_rent/src/common/widgets/input_field/input_field.dart';

class PasswordBody extends StatelessWidget {
  final GlobalKey<FormState> passwordFormKey;
  final TextEditingController passwordController;
  final VoidCallback onContinueTap;
  final VoidCallback onPreviousTap;
  final Function(String?) passwordValidator;

  const PasswordBody({
    required this.passwordFormKey,
    required this.passwordController,
    required this.onContinueTap,
    required this.onPreviousTap,
    required this.passwordValidator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.large),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.locale.createNewPassword,
            style: context.themeData.textTheme.displayLarge?.copyWith(
              fontSize: AppFonts.sizeDisplayPreLarge,
              color: context.theme.primaryTextColor,
              fontWeight: AppFonts.weightSemiBold,
            ),
          ),
          const SizedBox(height: AppDimensions.medium),
          Text(
            context.locale.setAStrongNewPasswordForYourAccount,
            style: context.themeData.textTheme.headlineSmall?.copyWith(
              color: context.theme.secondaryTextColor,
              fontWeight: AppFonts.weightRegular,
            ),
          ),
          const SizedBox(height: AppDimensions.extraLarge),
          InputField(
            formKey: passwordFormKey,
            controller: passwordController,
            hintText: '********',
            validator: (passwd) => passwordValidator(passwd),
          ),
          const SizedBox(height: AppDimensions.extraLarge),
          CustomButton(
            buttonText: context.locale.continues,
            onTap: onContinueTap,
          ),
          const SizedBox(height: AppDimensions.large),
          CustomButton(
            buttonColor: context.theme.surfaceColor,
            buttonText: context.locale.previous,
            textStyle: context.themeData.textTheme.headlineMedium?.copyWith(
              fontWeight: AppFonts.weightSemiBold,
              color: context.theme.accentTextColor,
            ),
            onTap: onPreviousTap,
          ),
        ],
      ),
    );
  }
}
