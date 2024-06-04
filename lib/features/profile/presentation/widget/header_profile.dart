import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garno_music/common/widget/base_state.dart';
import 'package:garno_music/features/authorization/domain/services/authorization_api_service.dart';
import 'package:garno_music/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:garno_music/features/profile/presentation/bloc/profile_bloc.dart';

import '../../../../common/config.dart';
import '../../../../common/di/init.dart';
import '../../../../generated/l10n.dart';

class HeaderProfile extends StatefulWidget {
  const HeaderProfile({super.key});

  @override
  State<HeaderProfile> createState() => _HeaderProfileState();
}

class _HeaderProfileState extends ABaseState<HeaderProfile> {
  final _bloc = sl<ProfileBloc>();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: _bloc,
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50))),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  S.of(context).profile,
                  style: theme.textTheme.labelLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  radius: 45,
                  child: ClipOval(
                    child: AuthorizationService.currentUser?.avatar != null
                        ? Image.network(
                            API_URL + AuthorizationService.currentUser!.avatar!,
                            fit: BoxFit.cover,
                            width: 90,
                            height: 90,
                          )
                        : Image.asset(
                            'assets/images/no_avatar.png',
                            fit: BoxFit.cover,
                            width: 90,
                            height: 90,
                          ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  AuthorizationService.currentUser?.email ?? '',
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(AuthorizationService.currentUser?.username ?? ''),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
