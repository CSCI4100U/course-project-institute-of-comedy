import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

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
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: FlutterI18n.translate(context, "Bottom_NavBar.home_page"),
          backgroundColor: Colors.orange,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: FlutterI18n.translate(context, "Bottom_NavBar.profile_page"),
          backgroundColor: Colors.orange,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: FlutterI18n.translate(context, "Bottom_NavBar.shopping_cart"),
          backgroundColor: Colors.orange,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: FlutterI18n.translate(context, "Bottom_NavBar.wish_list"),
          backgroundColor: Colors.orange,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: FlutterI18n.translate(context, "Bottom_NavBar.settings"),
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
