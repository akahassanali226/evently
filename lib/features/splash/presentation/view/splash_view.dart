import 'package:evently/core/utils/asset_manager.dart';
import 'package:evently/core/utils/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetManager.logoHeaderUrl, width: width * 0.4)
                .animate(
                  onComplete: (controller) {
                    Navigator.pushReplacementNamed(
                      context,
                      RouteManager.homeRoute,
                    );
                  },
                )
                .fadeIn(duration: 3000.ms)
                .scale(duration: 3000.ms)
                .rotate(duration: 3000.ms)
                .slide(),
            Image.asset(AssetManager.logoBottomUrl, width: width * 0.4)
                .animate(
                  onComplete: (controller) {
                    Navigator.pushReplacementNamed(
                      context,
                      RouteManager.homeRoute,
                    );
                  },
                )
                .fadeIn(duration: 3000.ms)
                .scale(duration: 3000.ms)
                .slide(),
          ],
        ),
      ),
    );
  }
}
