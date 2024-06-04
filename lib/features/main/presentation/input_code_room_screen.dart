import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garno_music/common/widget/base_state.dart';
import 'package:garno_music/common/widget/loading.dart';
import 'package:garno_music/features/main/presentation/bloc/player_bloc.dart';

import '../../../common/di/init.dart';
import '../../../generated/l10n.dart';

@RoutePage()
class InputCodeRoomScreen extends StatefulWidget {
  const InputCodeRoomScreen({super.key});

  @override
  State<InputCodeRoomScreen> createState() => _InputCodeRoomScreenState();
}

class _InputCodeRoomScreenState extends ABaseState<InputCodeRoomScreen> {
  final _bloc = sl<PlayerBloc>();
  final _focusNode = FocusNode();

  String _code = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 200,
                  child: Text(
                    S.of(context).inputCodeRoom,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.labelLarge,
                  )),
              const SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (t) => _code = t,
                focusNode: _focusNode,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    width: 110,
                    child: ElevatedButton(
                      onPressed: () => AutoRouter.of(context).back(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white38,
                        shadowColor: Colors.transparent,
                        side: BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      child: Text(
                        S.of(context).cancel,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  _buildConnectButton(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConnectButton() {
    return BlocBuilder<PlayerBloc, PlayerState>(
      bloc: _bloc,
      builder: (context, state) {
        var isLoading = state is ConnectingToRoomState;

        if (state is ConnectingToRoomSuccess) {
          AutoRouter.of(context).back();
        }

        if (state is ConnectingToRoomError) {
          showMessageAfterBuilding(context, state.error);
        }

        return SizedBox(
          height: 50,
          width: 110,
          child: ElevatedButton(
            onPressed: isLoading
                ? null
                : () => _bloc.add(JoinToRoomEvent(code: _code)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff9456F9),
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
            child: isLoading
                ? const Loading()
                : Text(
                    S.of(context).voyti,
                    style: TextStyle(color: Colors.white),
                  ),
          ),
        );
      },
    );
  }
}
