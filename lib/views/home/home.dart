import 'package:flutter/material.dart';
import 'package:medical_app/consts/colors.dart';
import 'package:medical_app/views/category_view/category_view.dart';
import 'package:medical_app/views/home/home_view.dart';
import 'package:medical_app/views/settings_view/settings_view.dart';

import '../appointment_view/appoitment_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List screenList = [
    const HomeView(),
    const AppointmentView(),
    const CategoryView(),
    const SettingsView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screenList.elementAt(selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.whiteColor,
          unselectedItemColor: Colors.white.withOpacity(0.5),
          selectedLabelStyle: TextStyle(color: AppColors.whiteColor),
          selectedIconTheme: IconThemeData(color: AppColors.whiteColor),
          backgroundColor: AppColors.blueColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.book),label: "Appointment"),
            BottomNavigationBarItem(icon: Icon(Icons.category),label: "Category"),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings"),
          ],
        ));
  }
}
