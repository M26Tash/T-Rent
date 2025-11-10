import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/cubit_scope/cubit_scope.dart';
import 'package:t_rent/src/common/di/injector.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/features/main_page/cubits/history_cubit/history_cubit.dart';
import 'package:t_rent/src/features/main_page/widgets/history_page/widgets/car_history_item.dart';

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
            return Center(
              child: Text(
                'NO RENT HISTORY',
                style: context.themeData.textTheme.headlineLarge?.copyWith(
                  color: context.theme.primaryTextColor,
                  fontWeight: AppFonts.weightBold,
                ),
              ),
            );
          }
          return SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(AppDimensions.large),
              children: [
                for (int i = 0; i < state.carRentHistory!.length; i++)
                  CarHistoryItem(
                    carOrder: state.carRentHistory![i],
                    onCarTap: () {},
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
