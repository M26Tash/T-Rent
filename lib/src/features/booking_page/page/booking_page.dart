import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/cubit_scope/cubit_scope.dart';
import 'package:t_rent/src/common/localization/localizations_ext.dart';
import 'package:t_rent/src/common/navigation/entities/auto_route_extension.dart';
import 'package:t_rent/src/common/navigation/entities/customized_route.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:t_rent/src/common/widgets/support_methods/support_methods.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_model.dart';
import 'package:t_rent/src/features/booking_page/cubit/booking_cubit.dart';
import 'package:t_rent/src/features/booking_page/widgets/booking_body.dart';
import 'package:t_rent/src/features/booking_page/widgets/custom_time_picker_widgets/time_picker_selection.dart';

@RoutePage()
class BookingPage extends StatelessWidget {
  final CarModel car;

  const BookingPage({
    required this.car,
    super.key,
  });

  Future<void> _listener(BuildContext context, BookingState state) async {
    if (state.route.type == TypeRoute.pop) {
      await context.maybePop();
    } else if (state.route.type != null) {
      context.navigateToRoute(state.route);
    }

    if (state.selectedStart != null && state.selectedEnd != null) {
      _timePickerBottomSheet(
        context: context,
        cubit: CubitScope.of<BookingCubit>(context),
        state: state,
        car: car,
      );
    }
  }

  bool _listenWhen(BookingState prev, BookingState current) {
    if (prev.route.type == null && current.route.type != null) return true;
    final wasRangeIncomplete =
        prev.selectedStart == null || prev.selectedEnd == null;
    final isRangeNowComplete =
        current.selectedStart != null && current.selectedEnd != null;

    return wasRangeIncomplete && isRangeNowComplete;
  }

  Future<void> _timePickerBottomSheet({
    required BuildContext context,
    required BookingCubit cubit,
    required BookingState state,
    required CarModel car,
  }) async {
    await SupportMethods.showBottomSheet(
      context: context,
      sheetTitle: 'Select Pick-up & Return Time',
      useRootNavigator: true,
      useCloseButton: false,
      child: TimePickerSelection(
        cubit: cubit,
        state: state,
        car: car,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<BookingCubit>(
      child: BlocConsumer<BookingCubit, BookingState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final bookingCubit = CubitScope.of<BookingCubit>(context);

          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: CustomAppBar(
              onLeadingTap: bookingCubit.navigateBack,
              svgAssetPath: AppAssets.arrowLeftIcon,
              title: context.locale.booking,
            ),
            body: SafeArea(
              child: BookingBody(
                onHomePageTap: () => bookingCubit.navigateToConfirmationPage(
                  car: car,
                ),
                selectedStart: state.selectedStart,
                selectedEnd: state.selectedEnd,
                onDayTap: bookingCubit.onDayTap,
                months: state.months,
              ),
            ),
          );
        },
      ),
    );
  }
}
