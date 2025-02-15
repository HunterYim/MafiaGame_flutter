import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mafiagame/screens/home_screen.dart';

/*
개선 사항
1. 버튼들 이름이 다음 단계라는 느낌이 없음
2. 스크롤 가능한 화면에서 느낌이 나도록 수정
*/

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
        focusColor: const Color(0xFFF54468),
        hintColor: const Color(0xFF49A741),
        highlightColor: const Color(0xFF1C7ACC),
        canvasColor: const Color(0xFFB3B3B3),
      ),
      home: const HomeScreen(),
    );
  }
}
