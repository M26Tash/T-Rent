import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/cubit_scope/cubit_scope.dart';
import 'package:t_rent/src/common/di/injector.dart';
import 'package:t_rent/src/common/localization/localizations_ext.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/features/main_page/cubits/history_cubit/history_cubit.dart';
import 'package:t_rent/src/features/main_page/widgets/history_page/widgets/history_body.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final HistoryCubit _historyCubit = i.get<HistoryCubit>();

  @override
  void initState() {
    super.initState();

    _historyCubit.getCarRentHistory();
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<HistoryCubit>(
      child: BlocBuilder<HistoryCubit, HistoryState>(
        builder: (context, state) {
          if (state.carRentHistory == null) {
            return Center(
              child: CircularProgressIndicator(
                color: context.theme.primaryColor,
              ),
            );
          }

          if (state.carRentHistory!.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(AppDimensions.large),
              child: Center(
                child: Text(
                  context.locale.youHaventBookAnyCarsYet,
                  style: context.themeData.textTheme.headlineLarge?.copyWith(
                    color: context.theme.primaryTextColor,
                    fontWeight: AppFonts.weightBold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return SafeArea(
            child: HistoryBody(
              carRentHistory: state.carRentHistory!,
            ),
          );
        },
      ),
    );
  }
}
