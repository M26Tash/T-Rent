import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/cubit_scope/cubit_scope.dart';
import 'package:t_rent/src/common/di/injector.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/utils/enums/car_type.dart';
import 'package:t_rent/src/features/main_page/cubits/home_cubit/home_cubit.dart';
import 'package:t_rent/src/features/main_page/widgets/home_page/widgets/home_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeCubit _homeCubit = i.get<HomeCubit>();

  @override
  void initState() {
    super.initState();

    _homeCubit
      ..getProfile()
      ..getCars();
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<HomeCubit>(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final homeCubit = CubitScope.of<HomeCubit>(context);

          if (state.profile == null || state.cars == null) {
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
                  profile: state.profile!,
                  cars: state.cars!,
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
