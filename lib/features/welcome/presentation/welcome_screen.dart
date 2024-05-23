import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:garno_music/features/main/presentation/main_page.dart';
import 'package:garno_music/features/welcome/domain/services/a_welcome_service.dart';
import 'package:garno_music/router/router.dart';

import '../../../common/di/init.dart';
import '../../../common/widget/logo.dart';
import '../../../generated/l10n.dart';

@RoutePage()
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    sl<IWelcomeService>().isAuth().then((v) => {
          if (v) {AutoRouter.of(context).replace(MainRoute())}
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DecoratedBox(
          decoration: const BoxDecoration(
            // Image set to background of the body
            image: DecorationImage(
                image: AssetImage("assets/images/welcome_bg.png"),
                fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Logo(),
                const Spacer(),
                Text(
                  textAlign: TextAlign.center,
                  S.of(context).enjoyMusic,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
                /*              Text(
                  S.of(context).freeInApp,
                  style: const TextStyle(),
                ),*/
                const SizedBox(
                  height: 50,
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 35.0),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            width: 300,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: ElevatedButton(
                              onPressed: () =>
                                  AutoRouter.of(context).push(SignInRoute()),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff9456F9),
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                              child: Text(
                                S.of(context).getStarted,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          //
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
