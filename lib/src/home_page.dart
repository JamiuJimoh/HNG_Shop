import 'package:flutter/material.dart';

import 'cart_page.dart';
import 'colors.dart';
import 'plants_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

const _pages = [PlantsPage(), CartPage()];

class _HomePageState extends State<HomePage> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (i) => setState(() => _selectedIndex = i),
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.store,
              color: _selectedIndex == 0 ? Colors.white : kInactiveColor,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.shopping_cart,
              color: _selectedIndex == 1 ? Colors.white : kInactiveColor,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
