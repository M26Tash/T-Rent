// ignore_for_file: unnecessary_lambdas

import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/localization/localizations_ext.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/widgets/custom_button/custom_button.dart';
import 'package:t_rent/src/common/widgets/input_field/input_field.dart';

class EmailBody extends StatelessWidget {
  final GlobalKey<FormState> emailFormKey;
  final TextEditingController emailController;
  final VoidCallback onContinueTap;
  final Function(String?) emailValidator;
  const EmailBody({
    required this.emailFormKey,
    required this.emailController,
    required this.onContinueTap,
    required this.emailValidator,
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
            context.locale.forgotPassword,
            style: context.themeData.textTheme.displayLarge?.copyWith(
              fontSize: AppFonts.sizeDisplayPreLarge,
              color: context.theme.primaryTextColor,
              fontWeight: AppFonts.weightSemiBold,
            ),
          ),
          const SizedBox(height: AppDimensions.medium),
          Text(
            context.locale.enterYourRegisteredEmailAddressWeWillSendYouCode,
            style: context.themeData.textTheme.headlineSmall?.copyWith(
              color: context.theme.secondaryTextColor,
              fontWeight: AppFonts.weightRegular,
            ),
          ),
          const SizedBox(height: AppDimensions.extraLarge),
          InputField(
            formKey: emailFormKey,
            controller: emailController,
            hintText: 'abc@test.com',
            validator: (email) =>  emailValidator(email),
          ),
          const SizedBox(height: AppDimensions.extraLarge),
          CustomButton(
            buttonText: context.locale.continues,
            onTap: onContinueTap,
          ),
        ],
      ),
    );
  }
}
