import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/OnBoarding/onBoarding.dart';
import 'package:movie_app/utiles/appAssets.dart';
import 'package:movie_app/utiles/appColors.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _floatController;
  late AnimationController _exitController;

  late Animation<double> logoFade;
  late Animation<double> logoScale;
  late Animation<double> blurAnim;

  late Animation<double> routeFade;
  late Animation<Offset> routeSlide;

  late Animation<double> textFade;

  late Animation<double> floatAnim;
  late Animation<double> shakeAnim;

  late Animation<double> exitFade;
  late Animation<double> exitScale;
  late Animation<double> exitBlur;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    logoFade = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
    );

    logoScale = Tween<double>(begin: 0.85, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOutBack),
      ),
    );

    blurAnim = Tween<double>(begin: 12, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    routeFade = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.25, 0.75, curve: Curves.easeOutCubic),
    );

    routeSlide = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.25, 0.75, curve: Curves.easeOutBack),
      ),
    );

    textFade = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.4, 0.9, curve: Curves.easeOut),
    );

    _controller.forward();

    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);

    floatAnim = Tween<double>(
      begin: -6,
      end: 6,
    ).animate(CurvedAnimation(
      parent: _floatController,
      curve: Curves.easeInOut,
    ));

    shakeAnim = Tween<double>(
      begin: -0.01,
      end: 0.01,
    ).animate(CurvedAnimation(
      parent: _floatController,
      curve: Curves.easeInOut,
    ));

    _exitController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    exitFade = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _exitController, curve: Curves.easeInOut),
    );

    exitScale = Tween<double>(begin: 1, end: 0.85).animate(
      CurvedAnimation(parent: _exitController, curve: Curves.easeInBack),
    );

    exitBlur = Tween<double>(begin: 0, end: 12).animate(
      CurvedAnimation(parent: _exitController, curve: Curves.easeInOut),
    );

    Future.delayed(const Duration(milliseconds: 4000), () async {
      if (!mounted) return;

      await _exitController.forward();

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 900),
          pageBuilder: (_, __, ___) => const Onboarding1(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: Tween<double>(begin: 0.95, end: 1).animate(animation),
                child: child,
              ),
            );
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _floatController.dispose();
    _exitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final h = size.height;
    final w = size.width;

    return Scaffold(
      backgroundColor: Appcolors.blackColor,
      body: AnimatedBuilder(
        animation: _exitController,
        builder: (_, __) {
          return Opacity(
            opacity: exitFade.value,
            child: Transform.scale(
              scale: exitScale.value,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (_, __) {
                        return BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: blurAnim.value + exitBlur.value,
                            sigmaY: blurAnim.value + exitBlur.value,
                          ),
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: RadialGradient(
                                colors: [
                                  Color(0xFF1A1A1A),
                                  Colors.black,
                                ],
                                radius: 1.2,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: h * 0.32,
                    left: (w - (w * 0.65)) / 2,
                    child: AnimatedBuilder(
                      animation: _floatController,
                      builder: (_, __) {
                        return FadeTransition(
                          opacity: logoFade,
                          child: ScaleTransition(
                            scale: logoScale,
                            child: Transform.translate(
                              offset: Offset(0, floatAnim.value),
                              child: Transform.rotate(
                                angle: shakeAnim.value,
                                child: Image.asset(
                                  Appassets.splashLogo,
                                  width: w * 0.65,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: h * 0.86,
                    left: (w - (w * 0.45)) / 2,
                    child: FadeTransition(
                      opacity: routeFade,
                      child: SlideTransition(
                        position: routeSlide,
                        child: Image.asset(
                          Appassets.routeText,
                          width: w * 0.45,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: h * 0.95,
                    left: 0,
                    right: 0,
                    child: FadeTransition(
                      opacity: textFade,
                      child: const Text(
                        "Supervised by Mohamed Nabil",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}