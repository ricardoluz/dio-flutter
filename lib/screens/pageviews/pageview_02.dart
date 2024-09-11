import 'package:flutter/material.dart';

class PageView02 extends StatefulWidget {
  const PageView02({super.key});

  @override
  State<PageView02> createState() => _PageView02State();
}

class _PageView02State extends State<PageView02> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const Center(
        child: Text("Pag 2"),
      ),
    );
  }
}
