import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tesla/colors.dart';
import 'package:tesla/presentation/welcome/welcome_screen.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      title: "Flutter",
      theme: const NeumorphicThemeData(
          baseColor: Color(0xFFFFFFFF),
          lightSource: LightSource.topLeft,
          depth: 10),
      darkTheme: NeumorphicThemeData(
        textTheme: TextTheme(
          displaySmall: GoogleFonts.lato(
            fontSize: 15,
            color: TextColors.textBodySmallColor,
            fontWeight: FontWeight.w400,
          ),
          labelSmall: GoogleFonts.lato(
            fontSize: 20,
            color: TextColors.textLargeLabelColor,
            fontWeight: FontWeight.w500,
          ),
          labelLarge: GoogleFonts.lato(
            fontSize: 150,
            color: TextColors.textLargeLabelColor,
            fontWeight: FontWeight.w300,
          ),
          bodySmall: GoogleFonts.lato(
            fontSize: 24,
            color: TextColors.textBodySmallColor,
            fontWeight: FontWeight.w400,
          ),
          bodyLarge: GoogleFonts.lato(
            fontSize: 40,
            color: TextColors.textBodyLargeColor,
            fontWeight: FontWeight.w900,
          ),
          titleSmall: GoogleFonts.lato(
            fontSize: 15,
            color: TextColors.textBodyLargeColor,
            fontWeight: FontWeight.w900,
          ),
          headlineSmall: GoogleFonts.lato(
            fontSize: 12,
            color: TextColors.textBodySmallColor,
            fontWeight: FontWeight.w900,
          ),
          bodyMedium: GoogleFonts.lato(
            fontSize: 20,
            color: TextColors.textBodyLargeColor,
            fontWeight: FontWeight.w900,
          ),
          displayMedium: GoogleFonts.roboto(
            fontSize: 40,
            color: TextColors.textBodyLargeColor,
            fontWeight: FontWeight.w900,
          ),
        ),
        baseColor: AppColors.neumorphicBackgroundColor,
        lightSource: LightSource.topLeft,
        depth: 6,
      ),
    );
  }
}
