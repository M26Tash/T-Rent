import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/core/domain/entities/car_order_model/car_order_model.dart';
import 'package:t_rent/src/features/main_page/widgets/history_page/widgets/car_history_item.dart';

class HistoryBody extends StatelessWidget {
  final List<CarOrderModel> carRentHistory;

  const HistoryBody({
    required this.carRentHistory,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
      children: [
        for (int i = 0; i < carRentHistory.length; i++)
          CarHistoryItem(
            carOrder: carRentHistory[i],
            onCarTap: () {},
          ),
      ],
    );
  }
}
