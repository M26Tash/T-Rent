import 'package:flutter/widgets.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/utils/extensions/list_extension.dart';
import 'package:t_rent/src/common/widgets/custom_button/custom_button.dart';
import 'package:t_rent/src/common/widgets/input_field/input_field.dart';

class HelpBody extends StatelessWidget {
  const HelpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(
        AppDimensions.large,
      ),
      children: <Widget>[
        const InputField(
          hintText: 'Subject',
        ),
        const InputField(
          hintText: 'Message',
          minLines: 19,
          maxLines: 20,
        ),
        const CustomButton(
          buttonText: 'Submit',
        ),
      ].insertBetween(
        const SizedBox(
          height: AppDimensions.large,
        ),
      ),
    );
  }
}
