import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garno_music/common/validation/validation_helper.dart';
import 'package:garno_music/common/widget/main_back_button.dart';
import 'package:garno_music/router/router.dart';

import '../../../../common/di/init.dart';
import '../../../../common/widget/logo.dart';
import '../../../../common/widget/need_help.dart';
import '../../../../common/widget/text_field.dart';
import '../../../../generated/l10n.dart';
import 'bloc/sign_up_bloc.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  String? name;
  String? email;
  String? password;
  bool _isVisiblePassword = false;
  bool _isLoading = false;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _bloc = sl<SignUpBloc>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<SignUpBloc, SignUpState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is SignUpSuccess) {
            AutoRouter.of(context).replace(MainRoute());
            return const Center(child: CircularProgressIndicator());
          }

          if (state is SignUpError) {
            _showMessage(context, state.error);
          }

          widget._isLoading = state is SignUpLoading;

          return Scaffold(body: _getForm());
        },
      ),
    );
  }

  Widget _getForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const Row(
              children: [MainBackButton(), Spacer(), Logo(), Spacer()],
            ),
            const SizedBox(
              height: 80,
            ),
            Text(S.of(context).regestration,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
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
                  validator: ValidationHelper.isNullOrEmpty,
                  onChange: (v) => widget.name = v,
                  hintText: S.of(context).fullName,
                  expands: true,
                )),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 70,
                child: BaseTextField(
                  validator: ValidationHelper.email,
                  onChange: (v) => widget.email = v,
                  hintText: S.of(context).email,
                  expands: true,
                )),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 70,
                child: BaseTextField(
                  validator: ValidationHelper.isNullOrEmpty,
                  onChange: (v) => widget.password = v,
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
                            : const Icon(Icons.visibility_off_outlined)),
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
                              _bloc.add(DoSignUpEvent(
                                  email: widget.email!,
                                  name: widget.name!,
                                  password: widget.password!));
                            }
                          },
                    child: widget._isLoading
                        ? const CircularProgressIndicator()
                        : Text(
                            S.of(context).createAccount,
                            style: const TextStyle(color: Colors.white),
                          ))),
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
                    S.of(context).doYouHaveMember,
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
                InkWell(
                  onTap: () => AutoRouter.of(context).back(),
                  child: Text(S.of(context).signIn,
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
