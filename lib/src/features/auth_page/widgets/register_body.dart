import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/utils/validators/auth_validators.dart';
import 'package:t_rent/src/common/widgets/custom_button/custom_button.dart';
import 'package:t_rent/src/common/widgets/input_field/input_field.dart';
import 'package:t_rent/src/features/auth_page/cubit/auth_cubit.dart';

class RegisterBody extends StatefulWidget {
  final AuthCubit authCubit;

  const RegisterBody({
    required this.authCubit,
    super.key,
  });

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  late final GlobalKey<FormState> _nameFormKey;
  late final GlobalKey<FormState> _emailFormKey;
  late final GlobalKey<FormState> _passwordFormKey;

  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();

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
          'Sign up',
          style: context.themeData.textTheme.displayLarge?.copyWith(
            fontSize: AppFonts.sizeDisplayPreLarge,
            color: context.theme.primaryTextColor,
            fontWeight: AppFonts.weightSemiBold,
          ),
        ),
        Text(
          'Please login to your account.',
          style: context.themeData.textTheme.headlineSmall?.copyWith(
            color: context.theme.secondaryTextColor,
            fontWeight: AppFonts.weightRegular,
          ),
        ),
        const SizedBox(height: AppDimensions.extraLarge),
        InputField(
          formKey: _nameFormKey,
          controller: _nameController,
          fieldTitle: 'Name',
          hintText: 'John Due',
          validator: (name) => AuthValidators.validateName(name!),
        ),
        const SizedBox(height: AppDimensions.large),
        InputField(
          formKey: _emailFormKey,
          controller: _emailController,
          fieldTitle: 'Email Address',
          hintText: 'abc@test.com',
          validator: (email) => AuthValidators.validateEmail(email!),
        ),
        const SizedBox(height: AppDimensions.large),
        InputField(
          formKey: _passwordFormKey,
          controller: _passwordController,
          fieldTitle: 'Password',
          hintText: '********',
          validator: (passwd) => AuthValidators.validatePassword(passwd!),
        ),
        const SizedBox(height: AppDimensions.large),
        CustomButton(
          buttonText: 'Register',
          onTap: () {
            final nameValidate = _nameFormKey.currentState?.validate();
            final emailValidate = _emailFormKey.currentState?.validate();
            final passwordValidate = _passwordFormKey.currentState?.validate();

            if (nameValidate! && emailValidate! && passwordValidate!) {}
          },
        ),
        const SizedBox(height: AppDimensions.large),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Already have an account?',
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
                text: 'Login',
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
