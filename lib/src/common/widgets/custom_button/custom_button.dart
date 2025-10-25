import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';

final class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onTap;
  final TextStyle? textStyle;
  final Color? buttonColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? backgroundOpacity;
  final MainAxisAlignment? mainAxisAlignment;

  const CustomButton({
    required this.buttonText,
    this.onTap,
    this.textStyle,
    this.buttonColor,
    this.backgroundOpacity,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.margin,
    this.mainAxisAlignment = MainAxisAlignment.start,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Material(
        color: buttonColor ?? context.theme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ??
              const BorderRadius.all(
                Radius.circular(AppDimensions.preLarge),
              ),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius ??
              const BorderRadius.all(
                Radius.circular(
                  AppDimensions.preLarge,
                ),
              ),
          child: Padding(
            padding: padding ??
                const EdgeInsets.symmetric(
                  horizontal: AppDimensions.large,
                  vertical: AppDimensions.large,
                ),
            child: Center(
              child: Text(
                buttonText,
                style: textStyle ??
                    context.themeData.textTheme.headlineMedium?.copyWith(
                      fontWeight: AppFonts.weightSemiBold,
                      color: context.theme.buttonTextColor,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
