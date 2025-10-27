import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/cubit_scope/cubit_scope.dart';
import 'package:t_rent/src/common/di/injector.dart';
import 'package:t_rent/src/common/localization/localizations_ext.dart';
import 'package:t_rent/src/common/navigation/entities/auto_route_extension.dart';
import 'package:t_rent/src/common/navigation/entities/customized_route.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:t_rent/src/features/my_account_page/cubit/my_account_cubit.dart';
import 'package:t_rent/src/features/my_account_page/widgets/my_account_body.dart';

@RoutePage()
class MyAccountPage extends StatefulWidget {
  const MyAccountPage({
    super.key,
  });

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  final MyAccountCubit _myAccountCubit = i.get<MyAccountCubit>();

  @override
  void initState() {
    super.initState();

    _myAccountCubit.getProfile();
  }

  void _listener(BuildContext context, MyAccountState state) {
    if (state.route.type == TypeRoute.pop) {
      context.maybePop();
    } else if (state.route.type != null) {
      context.navigateToRoute(state.route);
    }
  }

  bool _listenWhen(MyAccountState prev, MyAccountState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<MyAccountCubit>(
      child: BlocConsumer<MyAccountCubit, MyAccountState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final myAccountCubit = CubitScope.of<MyAccountCubit>(context);

          if (state.profile == null) {
            return Center(
              child: CircularProgressIndicator(
                color: context.theme.primaryColor,
              ),
            );
          }
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: CustomAppBar(
              svgAssetPath: AppAssets.arrowLeftIcon,
              onLeadingTap: myAccountCubit.navigateBack,
              title: context.locale.myAccount,
            ),
            body: MyAccountBody(
              profile: state.profile!,
              onDatePicked: myAccountCubit.updateDateOfBirth,
              onSubmitTap: myAccountCubit.updateUserDetails,
              onAvatarEditTap: myAccountCubit.getImage,
              pickedDateTime: null,
            ),
          );
        },
      ),
    );
  }
}
