import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:garno_music/common/validation/validation_helper.dart';
import 'package:garno_music/common/widget/logo.dart';
import 'package:garno_music/common/widget/need_help.dart';
import 'package:garno_music/common/widget/text_field.dart';
import 'package:garno_music/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../common/di/init.dart';
import '../../../../generated/l10n.dart';
import 'bloc/sign_in_bloc.dart';

@RoutePage()
class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  String? username;
  String? password;

  bool _isVisiblePassword = false;
  bool _isLoading = false;
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _bloc = sl<SignInBloc>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<SignInBloc, SignInState>(
          bloc: _bloc,
          builder: (context, state) {
            if (state is SignInSuccess) {
              AutoRouter.of(context).replace(MainRoute());
            }

            widget._isLoading = state is SignInLoading;

            if (state is SignInError) {
              _showMessage(context, state.error);
            }

            return _getMainForm();
          },
        ),
      ),
    );
  }

  Widget _getMainForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: IconButton(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(const Color(0xffE8E8E8))),
                      padding: EdgeInsets.zero,
                      onPressed: () => AutoRouter.of(context).back(),
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Color(0xff414141),
                        size: 15,
                      )),
                ),
                const Spacer(),
                const Logo(),
                const Spacer()
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(S.of(context).signIn,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                    const SizedBox(
                      height: 20,
                    ),
                    const NeedHelp(),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                        height: 70,
                        child: BaseTextField(
                          onChange: (v) => widget.username = v,
                          hintText: S.of(context).email,
                          expands: true,
                          validator: ValidationHelper.email,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        height: 70,
                        child: BaseTextField(
                          onChange: (v) => widget.password = v,
                          validator: ValidationHelper.isNullOrEmpty,
                          obscureText: !widget._isVisiblePassword,
                          hintText: S.of(context).password,
                          expands: true,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    widget._isVisiblePassword =
                                        !widget._isVisiblePassword;
                                  });
                                },
                                color: Color(0xff8D8D8D),
                                icon: widget._isVisiblePassword
                                    ? const Icon(Icons.visibility_outlined)
                                    : const Icon(
                                        Icons.visibility_off_outlined)),
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: double.infinity,
                        height: 70,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                backgroundColor: const Color(0xff9456F9)),
                            onPressed: widget._isLoading
                                ? null
                                : () {
                                    if (_formKey.currentState!.validate()) {
                                      _bloc.add(DoSignInEvent(
                                          username: widget.username!,
                                          password: widget.password!));
                                    }
                                  },
                            child: widget._isLoading
                                ? const CircularProgressIndicator()
                                : Text(
                                    S.of(context).signIn,
                                    style: const TextStyle(color: Colors.white),
                                  ))),
                  ]),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  color: const Color(0xffB0B0B0),
                  height: 1,
                )),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  S.of(context).or,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Container(
                  color: const Color(0xffB0B0B0),
                  height: 1,
                )),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    width: 80,
                    height: 80,
                    image: AssetImage('assets/images/google_logo.png')),
                Image(
                    width: 80,
                    height: 80,
                    image: AssetImage('assets/images/apple_logo.png')),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Text(
                    '${S.of(context).notAMember} ',
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
                InkWell(
                  onTap: () => AutoRouter.of(context).push(SignUpRoute()),
                  child: Text(S.of(context).registerNow,
                      style: const TextStyle(
                          fontSize: 13, color: Color(0xff288CE9))),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showMessage(BuildContext context, String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    });
  }
}
