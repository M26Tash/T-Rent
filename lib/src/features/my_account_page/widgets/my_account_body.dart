// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';

import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/utils/extensions/list_extension.dart';
import 'package:t_rent/src/common/widgets/custom_button/custom_button.dart';
import 'package:t_rent/src/common/widgets/input_field/input_field.dart';
import 'package:t_rent/src/common/widgets/vector_image/vector_image.dart';

class MyAccountBody extends StatefulWidget {
  const MyAccountBody({
    super.key,
  });

  @override
  State<MyAccountBody> createState() => _MyAccountBodyState();
}

class _MyAccountBodyState extends State<MyAccountBody> {
  late final TextEditingController _userNameController;
  late final TextEditingController _fullNameController;
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();

    _userNameController = TextEditingController();
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _userNameController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundColor: context.theme.surfaceColor,
                  radius: 70,
                  backgroundImage: const AssetImage(
                    AppAssets.userPlaceholder,
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton.small(
                      backgroundColor: context.theme.primaryColor,
                      shape: const CircleBorder(),
                      elevation: AppDimensions.none,
                      onPressed: () {},
                      child: VectorImage(
                        svgAssetPath: AppAssets.editIcon,
                        color: context.theme.tertiaryIconColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        InputField(
          controller: _userNameController,
          fieldTitle: 'Username',
          hintText: 'test user',
        ),
        InputField(
          controller: _fullNameController,
          fieldTitle: 'Full name',
          hintText: 'John Due',
        ),
        InputField(
          controller: _emailController,
          fieldTitle: 'Email',
          hintText: 'john.due@gmail.com',
        ),
        const InputField(
          fieldTitle: 'Date of Birth',
          hintText: '24.10.1996',
        ),
        CustomButton(
          onTap: () {},
          buttonText: 'Update',
        ),
      ].insertBetween(
        const SizedBox(
          height: AppDimensions.large,
        ),
      ),
    );
  }
}
