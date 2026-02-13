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
import 'package:t_rent/src/features/about_us_page/cubit/about_us_cubit.dart';
import 'package:t_rent/src/features/about_us_page/widgets/about_us_body.dart';

@RoutePage()
class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  Future<void> _listener(BuildContext context, AboutUsState state) async {
    if (state.route.type == TypeRoute.pop) {
      await context.maybePop();
    } else if (state.route.type != null) {
      context.navigateToRoute(state.route);
    }
  }

  bool _listenWhen(AboutUsState prev, AboutUsState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<AboutUsCubit>(
      child: BlocConsumer<AboutUsCubit, AboutUsState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final aboutUsCubit = CubitScope.of<AboutUsCubit>(context);

          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: CustomAppBar(
              svgAssetPath: AppAssets.arrowLeftIcon,
              onLeadingTap: aboutUsCubit.navigateBack,
              title: context.locale.aboutUs,
            ),
            body: const AboutUsBody(),
          );
        },
      ),
    );
  }
}
