import 'package:flutter/material.dart';

import '../Utility/CustomTheme.dart';
import 'Home.dart';
import 'Insights.dart';
import 'Settings.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});
  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final List<Widget> widgetList = const [
    Insights(),
    Home(),
    Settings(),
  ];

  int index = 1;

  @override
  Widget build(BuildContext context) {
    CustomTheme OBJ = CustomTheme.fromContext(context);
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          backgroundColor: Colors.white,
          elevation: 1,
          selectedIconTheme: const IconThemeData(size: 36),
          unselectedIconTheme: const IconThemeData(size: 32),
          items: [
            navBarItem(
              icon: Icons.insights_outlined,
              state: 0,
            ),
            navBarItem(
              icon: Icons.home_rounded,
              state: 1,
            ),
            navBarItem(
              icon: Icons.settings_outlined,
              state: 2,
            ),
          ]),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(
            top: OBJ.height * 0.02,
            left: OBJ.width * 0.06,
            right: OBJ.width * 0.06),
        child: IndexedStack(
          index: index,
          children: widgetList,
        ),
      )),
    );
  }

  BottomNavigationBarItem navBarItem({
    required IconData icon,
    required int state,
  }) {
    return BottomNavigationBarItem(
      tooltip: 'Home',
      icon: Icon(
        icon,
        color: state == index
            ? Color.fromARGB(255, 29, 26, 38)
            : Color.fromARGB(255, 126, 115, 159),
      ),
      label: '',
    );
  }
}
