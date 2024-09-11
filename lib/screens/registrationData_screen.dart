import 'package:dio_flutter_study/widgets/custom_AppBar.dart';
import 'package:flutter/material.dart';

class RegistrationDataScreen extends StatelessWidget {
  final String title;
  final List<String> data;

  const RegistrationDataScreen({
    super.key,
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(title: "Registro"),
      drawer: CustomDrawer(),
      body: Column(
        children: [Text("Nome")],
      ),
    );
  }
}
