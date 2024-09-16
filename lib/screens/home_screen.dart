import 'package:dio_flutter_study/screens/pageviews/pageview_01_card.dart';
import 'package:dio_flutter_study/screens/pageviews/pageview_02.dart';
import 'package:dio_flutter_study/screens/pageviews/pageview_03.dart';
import 'package:dio_flutter_study/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),
      appBar: CustomAppbar(titleApp: widget.title),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              children: const [
                CardPage(),
                PageView02(),
                PageView03(),
              ],
            ),
          ),
          BottomNavigationBar(
            currentIndex: currentPage,
            onTap: (value) {
              pageController.jumpToPage(value);
            },
            items: const [
              BottomNavigationBarItem(
                  label: "H1", icon: Icon(Icons.account_circle)),
              BottomNavigationBarItem(
                  label: "H2", icon: Icon(Icons.account_circle)),
              BottomNavigationBarItem(
                  label: "H3", icon: Icon(Icons.account_circle)),
            ],
          )
        ],
      ),
    );
  }
}
