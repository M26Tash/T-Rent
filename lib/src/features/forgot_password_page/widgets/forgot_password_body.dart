import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:t_rent/src/common/utils/validators/auth_validators.dart';
import 'package:t_rent/src/features/forgot_password_page/cubit/forgot_password_cubit.dart';
import 'package:t_rent/src/features/forgot_password_page/widgets/custom_horizontal_stepper.dart';
import 'package:t_rent/src/features/forgot_password_page/widgets/reset_flow_bodies/email_body.dart';
import 'package:t_rent/src/features/forgot_password_page/widgets/reset_flow_bodies/otp_body.dart';
import 'package:t_rent/src/features/forgot_password_page/widgets/reset_flow_bodies/password_body.dart';

class ForgotPasswordBody extends StatefulWidget {
  final ForgotPasswordCubit cubit;
  final int currentPageIndex;

  const ForgotPasswordBody({
    required this.cubit,
    required this.currentPageIndex,
    super.key,
  });

  @override
  State<ForgotPasswordBody> createState() => _ForgotPasswordBodyState();
}

class _ForgotPasswordBodyState extends State<ForgotPasswordBody> {
  late final AuthValidators _authValidators;

  late final GlobalKey<FormState> _emailFormKey;
  late final GlobalKey<FormState> _passwordFormKey;
  late final GlobalKey<FormState> _otpFormKey;

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _pinController;

  late final PageController _pageController;

  @override
  void initState() {
    super.initState();

    _authValidators = AuthValidators(context);

    _emailFormKey = GlobalKey<FormState>();
    _passwordFormKey = GlobalKey<FormState>();
    _otpFormKey = GlobalKey<FormState>();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _pinController = TextEditingController();

    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
    _pinController.dispose();

    _pageController.dispose();
  }

  @override
  void didUpdateWidget(covariant ForgotPasswordBody oldWidget) {
    super.didUpdateWidget(oldWidget);

    final page = widget.cubit.state.currentPageIndex;
    
    if (_pageController.hasClients &&
        _pageController.page?.toInt() != page &&
        _pageController.page?.toInt() != 2) {
      _pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    }
    if (_pageController.page?.toInt() == 2) {
      _pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 4),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            EmailBody(
              emailFormKey: _emailFormKey,
              emailController: _emailController,
              onContinueTap: widget.cubit.nextPage,
              emailValidator: (email) => _authValidators.validateEmail(email!),
            ),
            PasswordBody(
              passwordFormKey: _passwordFormKey,
              passwordController: _passwordController,
              onContinueTap: widget.cubit.nextPage,
              onPreviousTap: widget.cubit.previousPage,
              passwordValidator: (passwd) =>
                  _authValidators.validatePassword(passwd!),
            ),
            OtpBody(
              pinFormKey: _otpFormKey,
              pinController: _pinController,
              onVerifyTap: () {},
              onCancelTap: widget.cubit.resetFlow,
              otpValidator: (otp) => _authValidators.validateEmail(otp!),
            ),
          ],
        ),
        Container(
          alignment: const Alignment(0, -0.70),
          child: CustomHorizontalStepper(
            currentStep: widget.currentPageIndex,
          ),
        ),
      ],
    );
  }
}
