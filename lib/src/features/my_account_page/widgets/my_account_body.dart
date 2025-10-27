import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/localization/localizations_ext.dart';
import 'package:t_rent/src/common/utils/extensions/list_extension.dart';
import 'package:t_rent/src/common/widgets/avatar_pick_widget/avatar_pick_widget.dart';
import 'package:t_rent/src/common/widgets/custom_button/custom_button.dart';
import 'package:t_rent/src/common/widgets/input_field/input_field.dart';
import 'package:t_rent/src/common/widgets/support_methods/support_methods.dart';
import 'package:t_rent/src/core/domain/entities/profile_model/profile_model.dart';

class MyAccountBody extends StatefulWidget {
  final ProfileModel profile;
  final ValueChanged<DateTime?> onDatePicked;
  final ValueChanged<ProfileModel> onSubmitTap;
  final VoidCallback onAvatarEditTap;
  final DateTime? pickedDateTime;

  const MyAccountBody({
    required this.profile,
    required this.onDatePicked,
    required this.onSubmitTap,
    required this.onAvatarEditTap,
    required this.pickedDateTime,
    super.key,
  });

  @override
  State<MyAccountBody> createState() => _MyAccountBodyState();
}

class _MyAccountBodyState extends State<MyAccountBody> {
  late final TextEditingController _emailController;
  late final TextEditingController _fullNameController;
  late final TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController();
    _fullNameController = TextEditingController();
    _phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _fullNameController.dispose();
    _phoneNumberController.dispose();
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
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AvatarPickWidget(
              avatarUrl: widget.profile.avatarUrl,
              onEditTap: widget.onAvatarEditTap,
            ),
          ],
        ),
        InputField(
          controller: _emailController,
          fieldTitle: context.locale.email,
          hintText: widget.profile.email,
        ),
        InputField(
          controller: _fullNameController,
          fieldTitle: context.locale.fullName,
          hintText: widget.profile.fullName,
        ),
        InputField(
          onTap: _pickDate,
          fieldTitle: context.locale.dateOfBirth,
          hintText: '${widget.profile.dateOfBirth ?? '01.01.1980'}',
          readOnly: true,
        ),
        InputField(
          controller: _phoneNumberController,
          fieldTitle: context.locale.phoneNumber,
          hintText: widget.profile.phoneNumber,
        ),
        CustomButton(
          onTap: () {},
          buttonText: context.locale.update,
        ),
      ].insertBetween(
        const SizedBox(
          height: AppDimensions.large,
        ),
      ),
    );
  }
}
