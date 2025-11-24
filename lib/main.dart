import 'package:flutter/material.dart';
import 'screens/intake_screen.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(const HumaiApp());
}

class HumaiApp extends StatelessWidget {
  const HumaiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HumAI Digital Twin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        scaffoldBackgroundColor: const Color(0xFF050816),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        cardTheme: CardTheme(
          color: const Color(0xFF0B1120),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          elevation: 3,
        ),
      ),
      initialRoute: '/intake',
      routes: {
        '/intake': (_) => const IntakeScreen(),
        '/dashboard': (_) => const DashboardScreen(),
      },
    );
  }
}