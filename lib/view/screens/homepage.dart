import 'package:disease_analysis/view/screens/dataset/dataset_main_screen.dart';
import 'package:disease_analysis/view/screens/frequent_patterns/frequent_patterns_main_screen.dart';
import 'package:disease_analysis/view/screens/k_nn/knn_data_entry.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });
  @override
  State<HomePage> createState() => _HomePageState();
  static const routeName = '/home_page';
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  Widget getWidgets(int index) {
    switch (index) {
      case 0:
        return const DatasetScreen();
      case 1:
        return const KnnScreen();
      case 2:
        return const FrequentPatternsMainScreen();
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // curved navigation bar
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 22,
        unselectedFontSize: 18,
        unselectedItemColor: Colors.white,
        unselectedIconTheme: const IconThemeData(size: 24),
        selectedIconTheme: const IconThemeData(size: 30),
        selectedItemColor: Colors.red,
        backgroundColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Dataset',
            icon: Icon(
              Icons.dataset,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            label: 'K-NN',
            icon: Icon(
              Icons.calculate,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            label: 'FP-Growth',
            icon: Icon(
              Icons.military_tech,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: getWidgets(_selectedIndex),
    );
  }
}
