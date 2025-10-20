import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/cubit_scope/cubit_scope.dart';
import 'package:t_rent/src/common/navigation/entities/auto_route_extension.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/utils/enums/car_type.dart';
import 'package:t_rent/src/features/home_page/cubit/home_cubit.dart';
import 'package:t_rent/src/features/home_page/widgets/home_body.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _listener(BuildContext context, HomeState state) {
    if (state.route.type != null) {
      context.navigateToRoute(state.route);
    }
  }

  bool _listenWhen(HomeState prev, HomeState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<HomeCubit>(
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final homeCubit = CubitScope.of<HomeCubit>(context);
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
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
