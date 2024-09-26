import 'dart:math';

import 'package:dio_flutter_study/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RandomNumbersPage extends StatefulWidget {
  const RandomNumbersPage({super.key});

  @override
  State<RandomNumbersPage> createState() => _RandomNumbersPageState();
}

class _RandomNumbersPageState extends State<RandomNumbersPage> {
  //
  final String keyRandomNumber = 'random_number';
  final String keyNumberOfClicks = 'number_of_clicks';

  //
  int? generatedNumber;
  int? numberOfClicks;
  late final SharedPreferences storage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readStorage();
  }

  Future<void> readStorage() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      generatedNumber = storage.getInt(keyRandomNumber);
      numberOfClicks = storage.getInt(keyNumberOfClicks) ?? 0;
      debugPrint("\naa\n");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(titleApp: "Núm. Aleatórios"),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              generatedNumber != null ? generatedNumber.toString() : "---",
              style: const TextStyle(fontSize: 24),
            ),
            Text(numberOfClicks.toString()),
            TextButton(
                onPressed: () async {
                  // storage = await SharedPreferences.getInstance();
                  storage.remove(keyRandomNumber);
                  storage.remove(keyNumberOfClicks);
                  generatedNumber = null;
                  numberOfClicks = 0;
                  setState(() {});
                },
                child: Text("Clean the number"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // final storage = await SharedPreferences.getInstance();
          Random random = Random();
          setState(() {
            generatedNumber = random.nextInt(1000);
            numberOfClicks = (numberOfClicks ?? 0) + 1;
          });

          storage.setInt(keyRandomNumber, generatedNumber!);
          storage.setInt(keyNumberOfClicks, numberOfClicks!);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
