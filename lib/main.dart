import 'package:flutter/material.dart';
import 'package:hackathon/di/di/di_init.dart';
import 'package:hackathon/presentation/screens/auth/login_screen.dart';

void main() {
  DependencyInitializer.ensureInitialized();
  runApp(const SegmentApp());
}

class SegmentApp extends StatelessWidget {
  const SegmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Solution',
      home: LoginScreen(),
    );
  }
}
