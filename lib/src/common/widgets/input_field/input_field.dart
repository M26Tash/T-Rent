import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/constants/font_family.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';

final class InputField extends StatelessWidget {
  final GlobalKey<FormState>? formKey;
  final String? Function(String?)? validator;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final String? fieldTitle;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;
  final FocusNode? focusNode;
  final bool? readOnly;
  final TextCapitalization textCapitalization;
  final InputDecoration? inputDecoration;
  final TextInputType? keyboardType;
  final String? initialValue;
  final List<TextInputFormatter>? formatters;
  final bool enableInteractiveSelection;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  // final int? minLines;
  // final int? maxLines;
  final bool obscureText;

  const InputField({
    this.hintText,
    this.keyboardType,
    this.formKey,
    this.validator,
    this.onChanged,
    this.controller,
    this.inputDecoration,
    this.onTap,
    this.onEditingComplete,
    this.readOnly,
    this.fieldTitle,
    this.formatters,
    this.focusNode,
    this.textCapitalization = TextCapitalization.sentences,
    this.initialValue,
    this.enableInteractiveSelection = true,
    this.prefixIcon,
    this.suffixIcon,
    this.hintStyle,
    // this.minLines = 1,
    // this.maxLines = 2,
    this.obscureText = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorPath = context.theme;
    final themePath = context.themeData.textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (fieldTitle != null)
          Padding(
            padding: const EdgeInsets.only(bottom: AppDimensions.extraSmall),
            child: Text(
              '$fieldTitle',
              style: themePath.headlineSmall?.copyWith(
                fontWeight: AppFonts.weightMedium,
                color: context.theme.primaryTextColor,
              ),
            ),
          ),
        Form(
          key: formKey,
          child: TextFormField(
            obscureText: obscureText,
            // minLines: minLines,
            // maxLines: maxLines,
            enableInteractiveSelection: enableInteractiveSelection,
            autovalidateMode: AutovalidateMode.disabled,
            initialValue: initialValue,

            onEditingComplete: onEditingComplete,
            readOnly: readOnly ?? false,
            keyboardType: keyboardType,
            inputFormatters: formatters,
            textCapitalization: textCapitalization,
            style: themePath.headlineMedium?.copyWith(
              color: colorPath.secondaryTextColor,
              fontWeight: AppFonts.weightMedium,
              fontFamily: FontFamily.carmeFamily,
            ),
            controller: controller,
            validator: validator,
            cursorColor: colorPath.primaryColor,
            focusNode: focusNode,
            decoration: inputDecoration ??
                InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: AppDimensions.medium,
                    horizontal: AppDimensions.large,
                  ),
                  filled: true,
                  fillColor: colorPath.surfaceColor,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: colorPath.surfaceColor,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        AppDimensions.preLarge,
                      ),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: colorPath.surfaceColor,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        AppDimensions.preLarge,
                      ),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: colorPath.surfaceColor,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        AppDimensions.preLarge,
                      ),
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: colorPath.errorColor),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        AppDimensions.preLarge,
                      ),
                    ),
                  ),
                  errorStyle:
                      context.themeData.textTheme.headlineSmall?.copyWith(
                    color: context.theme.errorColor,
                    fontWeight: AppFonts.weightMedium,
                  ),
                  hintText: hintText,
                  hintStyle: hintStyle ??
                      themePath.headlineMedium?.copyWith(
                        fontWeight: AppFonts.weightRegular,
                        color: context.theme.hintTextColor,
                        height: AppFonts.sizeFactorLarge,
                        fontFamily: FontFamily.carmeFamily,
                      ),
                  prefixIcon: prefixIcon != null
                      ? Padding(
                          padding: const EdgeInsets.all(
                            AppDimensions.large,
                          ),
                          child: prefixIcon,
                        )
                      : null,
                  suffixIcon: suffixIcon != null
                      ? Padding(
                          padding: EdgeInsets.zero,
                          child: suffixIcon,
                        )
                      : null,
                ),
            onChanged: onChanged,
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}
