import 'package:arfpaymentapp/constants/routes.dart';
import 'package:arfpaymentapp/views/login_screen.dart';
import 'package:arfpaymentapp/views/reg_success.dart';
import 'package:arfpaymentapp/views/register_screen.dart';
import 'package:arfpaymentapp/views/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

MaterialColor myCustomColor = const MaterialColor(
  0xFF088E48,
  <int, Color>{
    50: Color(0xFFE0F4E4),
    100: Color(0xFFB3E4C6),
    200: Color(0xFF80D4A4),
    300: Color(0xFF4DC482),
    400: Color(0xFF26B868),
    500: Color(0xFF088E48), // The custom color value
    600: Color(0xFF007F3D),
    700: Color(0xFF006F36),
    800: Color(0xFF005F2F),
    900: Color(0xFF004D22),
  },
);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: myCustomColor,
        primaryColor: const Color(0xFF088E48),
      ),
      home: const WelcomeScreen(),
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        successRoute: (context) => const SuccessView(),
      },
    );
  }
}
