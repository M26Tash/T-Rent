import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/cubit_scope/cubit_scope.dart';
import 'package:t_rent/src/common/navigation/entities/auto_route_extension.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:t_rent/src/features/user_details_page/cubit/user_details_cubit.dart';
import 'package:t_rent/src/features/user_details_page/widgets/user_details_body.dart';

@RoutePage()
class UserDetailsPage extends StatefulWidget {
  final String email;
  final String fullName;

  const UserDetailsPage({
    required this.email,
    required this.fullName,
    super.key,
  });

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  void _listener(BuildContext context, UserDetailsState state) {
    if (state.route.type != null) {
      context.navigateToRoute(state.route);
    }
  }

  bool _listenWhen(UserDetailsState prev, UserDetailsState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<UserDetailsCubit>(
      child: BlocConsumer<UserDetailsCubit, UserDetailsState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final userDetailsCubit = CubitScope.of<UserDetailsCubit>(context);
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: const CustomAppBar(
              title: 'User Details',
            ),
            body: UserDetailsBody(
              email: widget.email,
              fullName: widget.fullName,
              onDatePicked: userDetailsCubit.updateDateOfBirth,
              onSubmitTap: (profile) {
                userDetailsCubit
                  ..updateUserDetails(profile)
                  ..navigateToMain();
              },
              onAvatarEditTap: userDetailsCubit.getImage,
              pickedDateTime: state.dateOfBirth,
              avatarUrl:
                  userDetailsCubit.currentUser?.userMetadata?['avatar_url'],
            ),
          );
        },
      ),
    );
  }
}
