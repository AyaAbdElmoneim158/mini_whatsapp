import 'package:flutter/material.dart';

import 'core/utils/constants/app_constants.dart';
import 'core/utils/constants/colors.dart';
import 'core/utils/constants/sizes.dart';
import 'core/utils/constants/styles.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int currentIndex = 0;
  List<Widget> screens = AppConstants.screens;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: screens[currentIndex],
    );
  }

  Widget _buildBottomNavigationBar() => Container(
        height: AppSizes.bottomNavigationBarHeight,
        decoration: AppStyles.bottomNavigationDecoration,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.darkGrey,
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          items: AppConstants.items(currentIndex),
        ),
      );
}
