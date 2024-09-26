import 'package:dio_flutter_study/screens/random_numbers.dart';
import 'package:dio_flutter_study/screens/registration_data_screen.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        title: 'DIO Flutter Study',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
        ),
        initialRoute: "home",
        routes: {
          "home": (context) => const MyHomePage(
                title: 'DIO Flutter Study | Home Page',
              ),
          "registration": (context) => const RegistrationDataScreen(),
          "randomNumbers": (context) => const RandomNumbersPage(),
        },
      ),
    );
  }
}
