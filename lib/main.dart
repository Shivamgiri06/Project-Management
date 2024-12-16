import 'package:flutter/material.dart';
import 'package:project_manager/screens/onboarding_screen.dart';
import 'app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.background, // Primary color for the app
        scaffoldBackgroundColor: AppColors.background, // Background color for scaffold
        appBarTheme: const AppBarTheme(
          color: AppColors.background, // App bar background color
          iconTheme: IconThemeData(color: Colors.white), // App bar icons color
          titleTextStyle: TextStyle(
            color: Colors.white, // App bar title text color
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const OnboardingPage(), // Use the OnboardingPage widget
    );
  }
}
