import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/animate.dart';
import 'package:flutter_animate/effects/effects.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 4), () {Navigator.pushReplacementNamed(context, "/nav"); });
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Image.asset("assets/gdsc-logo.png")
                    .animate()
                    .scale(
                        begin: 0,
                        end: 0.5,
                        delay: const Duration(seconds: 0),
                        duration: const Duration(seconds: 1))
                    .then()
                    .shake(delay: const Duration(seconds: 1,milliseconds: 200),duration: const Duration(seconds: 1),hz:1)
                    .shimmer(
                        delay: const Duration(seconds: 1), duration: const Duration(seconds: 2)),
              ],
            ),
          ),
      ),

    );
  }
}
