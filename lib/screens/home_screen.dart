import 'package:flutter/material.dart';
import 'package:ticket_force/screens/tabs/apprehension_tab.dart';
import 'package:ticket_force/screens/tabs/drivers_tab.dart';
import 'package:ticket_force/screens/tabs/history_tab.dart';
import 'package:ticket_force/utils/colors.dart';
import 'package:ticket_force/widgets/drawer_widget.dart';

int index = 0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late dynamic userData1 = {};

  @override
  Widget build(BuildContext context) {
    print(index);
    final tabs = [
      const DriversTab(),
      const ApprehensionTab(),
      const HistoryTab(),
    ];

    return Scaffold(
        drawer: const DrawerWidget(),
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: primary,
          title: Image.asset(
            'assets/images/logs.png',
            height: 50,
          ),
        ),
        bottomNavigationBar: Material(
          elevation: 0,
          color: Colors.transparent,
          child: BottomNavigationBar(
            currentIndex: index,
            backgroundColor: primary,
            selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'QBold',
                color: Colors.white),
            unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.normal,
                fontFamily: 'QRegular',
                color: Colors.grey),
            unselectedItemColor: Colors.black,
            items: const [
              BottomNavigationBarItem(
                  label: 'Drivers', icon: Icon(Icons.person)),
              BottomNavigationBarItem(
                  label: 'Apprehension', icon: Icon(Icons.receipt)),
              BottomNavigationBarItem(
                  label: 'History', icon: Icon(Icons.history)),
            ],
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Gray.png'), fit: BoxFit.cover),
          ),
          child: SafeArea(child: tabs[index]),
        ));
  }
}
