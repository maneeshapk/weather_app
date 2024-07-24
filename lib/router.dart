import 'package:flutter/material.dart';
import 'package:kalavastha/routing.dart';
import 'package:kalavastha/screens/Homepage.dart';
import 'package:kalavastha/screens/splashscreen.dart';

class RouterScreen extends StatelessWidget {
  const RouterScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.splashscreen:(context)=>const SplashScreen(),
        Routes.homepage:(context) => const HomePage(),
      },
    );
  }
}