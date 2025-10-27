import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/localization/localizations_ext.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/utils/validators/auth_validators.dart';
import 'package:t_rent/src/common/widgets/custom_button/custom_button.dart';
import 'package:t_rent/src/common/widgets/input_field/input_field.dart';
import 'package:t_rent/src/common/widgets/vector_button/vector_button.dart';
import 'package:t_rent/src/features/auth_page/cubit/auth_cubit.dart';

class RegisterBody extends StatefulWidget {
  final AuthCubit authCubit;
  final bool isObscure;

  const RegisterBody({
    required this.authCubit,
    required this.isObscure,
    super.key,
  });

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  late final AuthValidators _authValidators;

  late final GlobalKey<FormState> _nameFormKey;
  late final GlobalKey<FormState> _emailFormKey;
  late final GlobalKey<FormState> _passwordFormKey;

  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();

    _authValidators = AuthValidators(context);

    _nameFormKey = GlobalKey<FormState>();
    _emailFormKey = GlobalKey<FormState>();
    _passwordFormKey = GlobalKey<FormState>();

    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _nameController.dispose();
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
          context.locale.signUp,
          style: context.themeData.textTheme.displayLarge?.copyWith(
            fontSize: AppFonts.sizeDisplayPreLarge,
            color: context.theme.primaryTextColor,
            fontWeight: AppFonts.weightSemiBold,
          ),
        ),
        Text(
          context.locale.createYourAccountToStartYourRide,
          style: context.themeData.textTheme.headlineSmall?.copyWith(
            color: context.theme.secondaryTextColor,
            fontWeight: AppFonts.weightRegular,
          ),
        ),
        const SizedBox(height: AppDimensions.extraLarge),
        InputField(
          formKey: _nameFormKey,
          controller: _nameController,
          fieldTitle: context.locale.name,
          hintText: 'John Due',
          validator: (name) => _authValidators.validateName(name!),
        ),
        const SizedBox(height: AppDimensions.large),
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
          obscureText: widget.isObscure,
          fieldTitle: context.locale.password,
          hintText: '********',
          validator: (passwd) => _authValidators.validatePassword(passwd!),
          suffixIcon: VectorButton(
            onTap: widget.authCubit.toggleObscure,
            svgAssetPath:
                widget.isObscure ? AppAssets.eyeOffIcon : AppAssets.eyeIcon,
            iconColor: context.theme.secondaryIconColor,
          ),
        ),
        const SizedBox(height: AppDimensions.large),
        CustomButton(
          buttonText: context.locale.register,
          onTap: () {
            final nameValidate = _nameFormKey.currentState?.validate();
            final emailValidate = _emailFormKey.currentState?.validate();
            final passwordValidate = _passwordFormKey.currentState?.validate();

            if (nameValidate! && emailValidate! && passwordValidate!) {
              widget.authCubit
                ..registerWithPassword(
                  email: _emailController.text.trim(),
                  password: _passwordController.text.trim(),
                )
                ..updateFullName(
                  fullName: _nameController.text.trim(),
                );
            }
          },
        ),
        const SizedBox(height: AppDimensions.large),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: context.locale.alreadyHaveAnAccount,
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
                text: context.locale.login,
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
