import 'package:done/Utility/CustomTheme.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'Navigation.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    CustomTheme OBJ = CustomTheme.fromContext(context);
    return AnimatedSplashScreen(
      duration: 1000,
      animationDuration: const Duration(milliseconds: 800),
      splashIconSize: OBJ.height,
      splash: Center(child: Image.asset("assets/images/sairamLogo.png")),
      nextScreen: const Navigation(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      backgroundColor: Colors.white,
    );
  }
}
