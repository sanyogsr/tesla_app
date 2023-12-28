import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:tesla/colors.dart';

Widget buildNeumorphicButton(
    {required String path,
    required VoidCallback onPressed,
    required Color color,
    required Color borderColor,
    required double borderWidth,
    double? depth = 15,
    required double scale}) {
  return NeumorphicButton(
    child: Transform.scale(
      scale: scale,
      child: Image.asset(path),
    ),
    duration: const Duration(milliseconds: 300),
    onPressed: onPressed,
    minDistance: 0,
    curve: Curves.linear,
    padding: EdgeInsets.all(8),
    style: NeumorphicStyle(
        shape: NeumorphicShape.convex,
        shadowDarkColor: AppColors.neumorphicShadowDarkColor,
        shadowLightColor: AppColors.neumorphicShadowLightColor,
        shadowDarkColorEmboss: AppColors.neumorphicShadowDarkColorEmboss,
        depth: depth,
        disableDepth: false,
        intensity: 0.8,
        surfaceIntensity: 0.1,
        boxShape: NeumorphicBoxShape.circle(),
        border: NeumorphicBorder(
            isEnabled: true, color: borderColor, width: borderWidth),
        color: color),
  );
}
