import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:kalavastha/screens/Homepage.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSplashScreen(
          splashIconSize: 1000,
          duration: 3000,
          splash: Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.3),
                child: Image.asset(
                  'assets/images/2.png',
                  height: 250,
                  width: 250,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          pageTransitionType: PageTransitionType.fade,
          nextScreen: const HomePage(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}