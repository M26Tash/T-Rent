import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/cubit_scope/cubit_scope.dart';
import 'package:t_rent/src/common/utils/mock/mock_car_list.dart';
import 'package:t_rent/src/features/main_page/cubits/history_cubit/history_cubit.dart';
import 'package:t_rent/src/features/main_page/widgets/history_page/widgets/car_history_item.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<HistoryCubit>(
      child: BlocBuilder<HistoryCubit, HistoryState>(
        builder: (context, state) {
          return SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(AppDimensions.large),
              children: [
                for (int i = 0; i < MockCarList.cars.length; i++)
                  CarHistoryItem(
                    mockCar: MockCarList.cars[i],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
