import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_final/provider/theme_provider.dart';

import '../screens/home_screen.dart';
import '../screens/saved_screen.dart';
import '../screens/search_screen.dart';
import '../screens/settings_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    SavedPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Color backgroundColor = themeProvider.isDarkMode ? Colors.black : Colors.white;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor, // Set background color here
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavBarItem(Icons.home, 'Home', 0),
              _buildNavBarItem(Icons.search, 'Search', 1),
              _buildNavBarItem(Icons.favorite, 'Search', 2),
              _buildNavBarItem(Icons.settings, 'Profile', 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavBarItem(IconData icon, String label, int index) {
    return IconButton(
      icon: Icon(icon),
      onPressed: () {
        setState(() {
          _selectedIndex = index;
        });
        _navigateToPage(context, index);
      },
      // color: _selectedIndex == index ? Colors.blue : Colors.grey,
    );
  }

  void _navigateToPage(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _widgetOptions[index],
        settings: RouteSettings(name: '/${_widgetOptions[index].runtimeType}'),
      ),
    );
  }
}
