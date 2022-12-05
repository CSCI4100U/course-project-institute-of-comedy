import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({
    super.key,
    required this.selectedId,
    required this.onTap,
  });

  final int selectedId;
  ValueChanged<int> onTap;

  // int _selectedIndex = 0;

  // void _onPageChange(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home Page',
          backgroundColor: Colors.orange,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile Page',
          backgroundColor: Colors.orange,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Shopping Cart',
          backgroundColor: Colors.orange,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Wish List',
          backgroundColor: Colors.orange,
        ),
      ],
      currentIndex: selectedId,
      onTap: onTap,
      type: BottomNavigationBarType.shifting,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      elevation: 0.0,
    );
  }
}
