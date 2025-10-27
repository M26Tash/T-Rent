import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/localization/localizations_ext.dart';
import 'package:t_rent/src/common/widgets/avatar_pick_widget/avatar_pick_widget.dart';
import 'package:t_rent/src/common/widgets/custom_button/custom_button.dart';
import 'package:t_rent/src/common/widgets/input_field/input_field.dart';
import 'package:t_rent/src/common/widgets/support_methods/support_methods.dart';
import 'package:t_rent/src/core/domain/entities/profile_model/profile_model.dart';

class UserDetailsBody extends StatefulWidget {
  final ValueChanged<DateTime?> onDatePicked;
  final ValueChanged<ProfileModel> onSubmitTap;
  final VoidCallback onAvatarEditTap;
  final String email;
  final String fullName;
  final DateTime? pickedDateTime;
  final String? avatarUrl;

  const UserDetailsBody({
    required this.onDatePicked,
    required this.onSubmitTap,
    required this.onAvatarEditTap,
    required this.email,
    required this.fullName,
    required this.pickedDateTime,
    required this.avatarUrl,
    super.key,
  });

  @override
  State<UserDetailsBody> createState() => _UserDetailsBodyState();
}

class _UserDetailsBodyState extends State<UserDetailsBody> {
  late final TextEditingController _fullNameController;
  late final TextEditingController _phoneNumberController;
  late final TextEditingController _dateOfBirthController;

  @override
  void initState() {
    super.initState();

    _fullNameController = TextEditingController(
      text: widget.fullName,
    );

    _phoneNumberController = TextEditingController();

    _dateOfBirthController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _dateOfBirthController.dispose();
  }

  Future<void> _pickDate() async {
    return SupportMethods.pickDate(
      context: context,
      onDatePicked: widget.onDatePicked,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AvatarPickWidget(
              avatarUrl: widget.avatarUrl,
              onEditTap: widget.onAvatarEditTap,
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.extraLarge),
        InputField(
          fieldTitle: context.locale.email,
          hintText: widget.email,
          readOnly: true,
        ),
        const SizedBox(height: AppDimensions.large),
        InputField(
          fieldTitle: context.locale.fullName,
          controller: _fullNameController,
          hintText: widget.fullName,
        ),
        const SizedBox(height: AppDimensions.large),
        InputField(
          onTap: _pickDate,
          fieldTitle: context.locale.dateOfBirth,
          hintText: '${widget.pickedDateTime ?? '01.01.1980'}',
          readOnly: true,
        ),
        const SizedBox(height: AppDimensions.large),
        InputField(
          fieldTitle: context.locale.phoneNumber,
          controller: _phoneNumberController,
          hintText: '+90 (555) 900-00-00',
        ),
        const SizedBox(height: AppDimensions.extraLarge),
        CustomButton(
          buttonText: context.locale.submit,
          onTap: () => widget.onSubmitTap(
            ProfileModel(
              email: widget.email,
              fullName: _fullNameController.text.trim(),
              phoneNumber: _phoneNumberController.text.trim(),
              dateOfBirth: DateTime.tryParse(
                _dateOfBirthController.text.trim(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
