import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/utils/constant/colors.dart';
import 'package:hidup_fit/utils/constant/sizes.dart';

import '../controllers/navigation_menu_controller.dart';

class NavigationMenuView extends GetView<NavigationMenuController> {
  const NavigationMenuView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: controller.pages,
        ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
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
              currentIndex: controller.selectedIndex.value,
              onTap: (index) {
                controller.selectedIndex.value = index;
              },
              iconSize: MySizes.iconLg,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: MyColors.dark,
              unselectedItemColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              backgroundColor: MyColors.primary,
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
      ),
    );
  }
}
