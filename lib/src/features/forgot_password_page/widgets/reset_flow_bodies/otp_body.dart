// ignore_for_file: unnecessary_lambdas

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/constants/font_family.dart';
import 'package:t_rent/src/common/localization/localizations_ext.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/widgets/custom_button/custom_button.dart';

class OtpBody extends StatelessWidget {
  final GlobalKey<FormState> pinFormKey;
  final TextEditingController pinController;
  final VoidCallback onVerifyTap;
  final VoidCallback onCancelTap;
  final Function(String?) otpValidator;

  const OtpBody({
    required this.pinFormKey,
    required this.pinController,
    required this.onVerifyTap,
    required this.onCancelTap,
    required this.otpValidator,
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
            context.locale.verifyOtp,
            style: context.themeData.textTheme.displayLarge?.copyWith(
              fontSize: AppFonts.sizeDisplayPreLarge,
              color: context.theme.primaryTextColor,
              fontWeight: AppFonts.weightSemiBold,
            ),
          ),
          const SizedBox(height: AppDimensions.medium),
          Text(
            context.locale.enterSixDigitCodeWeSentYou,
            style: context.themeData.textTheme.headlineSmall?.copyWith(
              color: context.theme.secondaryTextColor,
              fontWeight: AppFonts.weightRegular,
            ),
          ),
          const SizedBox(height: AppDimensions.extraLarge),
          Form(
            key: pinFormKey,
            child: Pinput(
              controller: pinController,
              length: 6,
              errorPinTheme: PinTheme(
                height: AppDimensions.pinputHeight,
                width: AppDimensions.pinputWidth,
                decoration: BoxDecoration(
                  color: context.theme.surfaceColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      AppDimensions.medium,
                    ),
                  ),
                  border: Border.all(
                    color: context.theme.errorColor,
                  ),
                ),
                textStyle: context.themeData.textTheme.headlineLarge?.copyWith(
                  color: context.theme.primaryTextColor,
                  fontWeight: AppFonts.weightRegular,
                  fontFamily: FontFamily.carmeFamily,
                ),
              ),
              defaultPinTheme: PinTheme(
                height: AppDimensions.pinputHeight,
                width: AppDimensions.pinputWidth,
                decoration: BoxDecoration(
                  color: context.theme.surfaceColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      AppDimensions.medium,
                    ),
                  ),
                ),
                textStyle: context.themeData.textTheme.headlineLarge?.copyWith(
                  color: context.theme.primaryTextColor,
                  fontWeight: AppFonts.weightRegular,
                  fontFamily: FontFamily.carmeFamily,
                ),
              ),
              validator: (otp) => otpValidator(otp),
            ),
          ),
          const SizedBox(height: AppDimensions.extraLarge),
          CustomButton(
            buttonText: context.locale.verify,
            onTap: onVerifyTap,
          ),
          const SizedBox(height: AppDimensions.large),
          CustomButton(
            buttonColor: context.theme.surfaceColor,
            buttonText: context.locale.cancel,
            textStyle: context.themeData.textTheme.headlineMedium?.copyWith(
              fontWeight: AppFonts.weightSemiBold,
              color: context.theme.accentTextColor,
            ),
            onTap: onCancelTap,
          ),
        ],
      ),
    );
  }
}
