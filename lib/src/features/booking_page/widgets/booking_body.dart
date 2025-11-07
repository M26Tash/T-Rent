import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/localization/localizations_ext.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/widgets/custom_button/custom_button.dart';

class BookingBody extends StatelessWidget {
  final VoidCallback onHomePageTap;

  const BookingBody({
    required this.onHomePageTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
      children: [
        Image.asset(AppAssets.vintageIllustrationBg),
        Text(
          context.locale.yourCarsReadyToRoll,
          style: context.themeData.textTheme.headlineLarge?.copyWith(
            color: context.theme.primaryTextColor,
            fontWeight: AppFonts.weightBold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppDimensions.large),
        Text(
          context.locale.bookingDetailsAreOnTheirWayToYourInbox,
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            color: context.theme.primaryTextColor,
            fontWeight: AppFonts.weightSemiBold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppDimensions.superLarge),
        CustomButton(
          buttonText: context.locale.homePage,
          onTap: onHomePageTap,
        ),
      ],
    );
  }
}
