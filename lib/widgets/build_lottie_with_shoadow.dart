import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BuildLottieWithShadow extends StatefulWidget {
  final String lottie;
  const BuildLottieWithShadow({super.key, required this.lottie});

  @override
  State<BuildLottieWithShadow> createState() => _BuildLottieWithShadowState();
}

class _BuildLottieWithShadowState extends State<BuildLottieWithShadow> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 5.0, // Adjust the position as needed
          left: 5.0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: Lottie.asset(widget.lottie, width: 12, height: 13),
          ),
        ),
      ],
    );
  }
}
