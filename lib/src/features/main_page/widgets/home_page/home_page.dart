import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/cubit_scope/cubit_scope.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/utils/enums/car_type.dart';
import 'package:t_rent/src/features/main_page/cubits/home_cubit/home_cubit.dart';
import 'package:t_rent/src/features/main_page/widgets/home_page/widgets/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<HomeCubit>(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final homeCubit = CubitScope.of<HomeCubit>(context);

          if (state.isAddressLoading == true) {
            return Center(
              child: CircularProgressIndicator(
                color: context.theme.primaryColor,
              ),
            );
          }

          return DefaultTabController(
            length: CarType.values.length,
            child: Scaffold(
              backgroundColor: context.theme.backgroundColor,
              body: SafeArea(
                child: HomeBody(
                  mockCarList: state.mockCarList,
                  onTabTap: (index) => homeCubit.selectCarType(
                    CarType.values[index],
                  ),
                  onSearchChanged: homeCubit.updateSearchQuery,
                  userAddress: state.userAddress ?? 'NOT FOUND',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
