import 'package:flutter/material.dart';

class PageView03 extends StatefulWidget {
  const PageView03({super.key});

  @override
  State<PageView03> createState() => _PageView03State();
}

class _PageView03State extends State<PageView03> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.tealAccent,
      child: const Center(
        child: Text("Pag 3"),
      ),
    );
  }
}
