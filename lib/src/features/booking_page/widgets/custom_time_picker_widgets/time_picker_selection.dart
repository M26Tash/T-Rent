import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/widgets/custom_button/custom_button.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_model.dart';
import 'package:t_rent/src/features/booking_page/cubit/booking_cubit.dart';
import 'package:t_rent/src/features/booking_page/widgets/custom_time_picker_widgets/custom_time_picker.dart';

class TimePickerSelection extends StatelessWidget {
  final CarModel car;
  final BookingCubit cubit;
  final BookingState state;

  const TimePickerSelection({
    required this.car,
    required this.cubit,
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            // Left Side: Pick-up Time
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Pick-up Time',
                    style: context.themeData.textTheme.headlineMedium?.copyWith(
                      color: context.theme.primaryTextColor,
                      fontWeight: AppFonts.weightBold,
                    ),
                  ),
                  VerticalTimePicker(
                    selectedDate: state.selectedStart!,
                    selectedTime: state.startTime,
                    onChanged: (time) => cubit.updateTimes(start: time),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Column(
                children: [
                  Text(
                    'Return Time',
                    style: context.themeData.textTheme.headlineMedium?.copyWith(
                      color: context.theme.primaryTextColor,
                      fontWeight: AppFonts.weightBold,
                    ),
                  ),
                  VerticalTimePicker(
                    selectedDate: state.selectedEnd!,
                    selectedTime: state.endTime,
                    onChanged: (time) => cubit.updateTimes(end: time),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.large),
        CustomButton(
          buttonText: 'Confirm',
          onTap: () {
            print('TAP');

            cubit.navigateToConfirmationPage(car: car);
          },
        ),
      ],
    );
  }
}
