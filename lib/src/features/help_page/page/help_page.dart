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
import 'package:t_rent/src/features/help_page/cubit/help_cubit.dart';
import 'package:t_rent/src/features/help_page/widgets/help_body.dart';

@RoutePage()
class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  void _listener(BuildContext context, HelpState state) {
    if (state.route.type == TypeRoute.pop) {
      context.maybePop();
    } else if (state.route.type != null) {
      context.navigateToRoute(state.route);
    }
  }

  bool _listenWhen(HelpState prev, HelpState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<HelpCubit>(
      child: BlocConsumer<HelpCubit, HelpState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final helpCubit = CubitScope.of<HelpCubit>(context);
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: CustomAppBar(
              svgAssetPath: AppAssets.arrowLeftIcon,
              onLeadingTap: helpCubit.navigateBack,
              title: context.locale.help,
            ),
            body: const HelpBody(),
          );
        },
      ),
    );
  }
}
