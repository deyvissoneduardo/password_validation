import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/validation_page.dart';

class PasswordValidationApp extends StatelessWidget {
  const PasswordValidationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Validation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: GoogleFonts.interTextTheme(),
      ),
      home: ValidationPage(),
    );
  }
}
