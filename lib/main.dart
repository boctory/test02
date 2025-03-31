import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:test02/pages/home_page_web_1440.dart';
import 'package:test02/pages/generate_page_web_1440.dart';
import 'package:test02/pages/result_page_web_1440.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konnect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        textTheme: GoogleFonts.notoSansKrTextTheme().copyWith(
          displayLarge: GoogleFonts.notoSansKr(
            fontSize: 36,
            fontWeight: FontWeight.w400,
          ),
          displayMedium: GoogleFonts.notoSansKr(
            fontSize: 30,
            fontWeight: FontWeight.w400,
          ),
          headlineMedium: GoogleFonts.montserrat(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          headlineSmall: GoogleFonts.notoSansKr(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          bodyLarge: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: GoogleFonts.notoSansKr(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          bodySmall: GoogleFonts.notoSansKr(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        useMaterial3: true,
      ),
      builder:
          (context, child) => ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 0, end: 640, name: MOBILE),
              const Breakpoint(start: 641, end: 840, name: TABLET),
              const Breakpoint(start: 841, end: 1440, name: DESKTOP),
              const Breakpoint(start: 1441, end: double.infinity, name: '4K'),
            ],
          ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePageWeb1440(),
        '/generate': (context) => const GeneratePageWeb1440(),
        '/result': (context) => const ResultPageWeb1440(),
      },
    );
  }
}
