import 'package:flutter/material.dart';

class PageView01 extends StatefulWidget {
  const PageView01({super.key});

  @override
  State<PageView01> createState() => _PageView01State();
}

class _PageView01State extends State<PageView01> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: const Center(
        child: Text("Pag 1"),
      ),
    );
  }
}
