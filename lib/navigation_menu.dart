import 'package:flutter/material.dart';
import 'package:hidup_fit/features/news/screens/news_screen.dart';
import 'package:hidup_fit/utils/constant/colors.dart';
import 'package:hidup_fit/utils/constant/sizes.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    Center(child: Text('Home Page')),
    Center(child: Text('Add Page')),
    Center(child: Text('Doctor Page')),
    NewsScreen(),
    Center(child: Text('Profile Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            iconSize: CustomSizes.iconLg,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: CustomColors.dark,
            unselectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            backgroundColor: CustomColors.primary,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_rounded),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.medical_information),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.newspaper_rounded,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
