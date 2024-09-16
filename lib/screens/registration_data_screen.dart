import 'package:dio_flutter_study/repositories/language_repository.dart';
import 'package:dio_flutter_study/repositories/level_repository.dart';
import 'package:dio_flutter_study/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegistrationDataScreen extends StatefulWidget {
  const RegistrationDataScreen({super.key});

  @override
  State<RegistrationDataScreen> createState() => _RegistrationDataScreenState();
}

class _RegistrationDataScreenState extends State<RegistrationDataScreen> {
  var f = NumberFormat("###,##0.00#", "pt_BR");

  //
  TextEditingController nomeController = TextEditingController(text: "");
  TextEditingController dtNascimentoController =
      TextEditingController(text: "");

  //
  LevelRepository levelRepository = LevelRepository();
  List levels = [];
  String levelChoice = "";

  //
  LanguageRepository languageRepository = LanguageRepository();
  List languages = [];
  List preferredLanguages = [];
  //
  int experienceTime = 1;
  //
  double targetSalary = 0.0;

  get items{
    List<DropdownMenuItem<int>> items = [];
    for (int i =1;i<10;i++) {
      items.add(DropdownMenuItem(value: i, child: Text(i.toString())));
    }
    return items;
  }

  @override
  void initState() {
    levels = levelRepository.returnLevels();
    languages = languageRepository.returnLanguages();
    super.initState();
  }

  //
  Container returnText(String text) {
    return Container(
      margin: const EdgeInsets.only(top: 26.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(titleApp: "Meus dados"),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: ListView(
          children: <Widget>[
            returnText("Nome"),
            TextField(
              controller: nomeController,
            ),
            returnText("Data de nascimento"),
            TextField(
              readOnly: true,
              controller: dtNascimentoController,
              onTap: () async {
                DateTime? dateChoice = await showDatePicker(
                  context: context,
                  initialDate: DateTime.timestamp(),
                  firstDate: DateTime(1900, 1, 1),
                  lastDate: DateTime(2300, 12, 31),
                );
                if (dateChoice != null) {
                  dtNascimentoController.text = dateChoice.toString();
                }
              },
            ),
            returnText("Nivel de experiência"),
            Column(
              children: levels
                  .map((e) => RadioListTile(
                        visualDensity: const VisualDensity(vertical: -4.0),
                        // dense: false,
                        value: e,
                        title: Text(e),
                        groupValue: levelChoice,
                        selected: levelChoice == e,
                        onChanged: (value) {
                          setState(() {
                            levelChoice = value;
                          });
                        },
                      ))
                  .toList(),
            ),
            returnText("Linguagens preferidas"),
            Column(
              children: languages
                  .map(
                    (language) => CheckboxListTile(
                      visualDensity: const VisualDensity(vertical: -4.0),
                      value: preferredLanguages.contains(language),
                      title: Text(language),
                      onChanged: (value) {
                        if (value!) {
                          preferredLanguages.add(language);
                        } else {
                          preferredLanguages.remove(language);
                        }
                        setState(() {
                          //Resfresh screen
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
            returnText("Tempo de experiência"),
            DropdownButton(
              items: items,
              onChanged: (value) {
                setState(() {
                  experienceTime = value!;
                });
              },
              isExpanded: true,
              value: experienceTime,
            ),
            returnText("Pretensão Salarial: R\$ ${f.format(targetSalary)}"),
            Slider(
                value: targetSalary,
                min: 0.00,
                max: 30000.00,
                label: targetSalary.toString(),
                divisions: 30000,
                onChanged: (value) {
                  setState(() => targetSalary = value);
                }),
            TextButton(
              onPressed: () {
                debugPrint(nomeController.text);
              },
              child: const Text("Salvar"),
            ),
          ],
        ),
      ),
    );
  }
}
