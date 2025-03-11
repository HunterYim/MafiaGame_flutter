import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mafiagame/screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  final Color whiteColor = const Color(0xFFFFFFFF);

  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF1F1F1F),
        cardColor: whiteColor,
        textTheme: TextTheme(
          headlineLarge: GoogleFonts.bowlbyOneSc(
              textStyle: TextStyle(
            fontSize: 90,
            color: whiteColor,
          )),
          titleSmall: GoogleFonts.doHyeon(
              textStyle: TextStyle(
            fontSize: 70,
            color: whiteColor,
          )),
          labelLarge: GoogleFonts.doHyeon(
              textStyle: TextStyle(
            fontSize: 50,
            color: whiteColor,
          )),
          labelMedium: GoogleFonts.doHyeon(
              textStyle: TextStyle(
            fontSize: 40,
            color: whiteColor,
          )),
          labelSmall: GoogleFonts.doHyeon(
              textStyle: TextStyle(
            fontSize: 30,
            color: whiteColor,
          )),
          bodyLarge: GoogleFonts.doHyeon(
              textStyle: TextStyle(
            fontSize: 30,
            color: whiteColor,
          )),
          bodyMedium: GoogleFonts.doHyeon(
              textStyle: TextStyle(
            fontSize: 20,
            color: whiteColor,
          )),
          bodySmall: GoogleFonts.doHyeon(
              textStyle: TextStyle(
            fontSize: 15,
            color: whiteColor,
          )),
        ),
        focusColor: const Color(0xFFFF335C), //0xFFF54468
        hintColor: const Color(0xFF49A741), // 간첩 팀 색상
        highlightColor: const Color(0xFF1C7ACC),
        canvasColor: const Color(0xFFB3B3B3),
      ),
      home: const HomeScreen(),
    );
  }
}
