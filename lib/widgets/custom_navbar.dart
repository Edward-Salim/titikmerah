import 'package:flutter/material.dart';
import 'package:titik_merah/screens/home_screen.dart';
import 'package:titik_merah/screens/leaderboard_screen.dart';
import 'package:titik_merah/screens/profile_screen.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, 0, context),
          _buildNavItem(Icons.emoji_events, 1, context),
          _buildNavItem(Icons.person, 2, context),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index, BuildContext context) {
    final bool isSelected = (selectedIndex == index);

    return GestureDetector(
      onTap: () {
        // Update the selected index (if you need to update state)
        onItemTapped(index);

        // Determine which screen to navigate to
        Widget target;
        switch (index) {
          case 0:
            target = HomeScreen();
            break;
          case 1:
            target = LeaderboardScreen();
            break;
          case 2:
            target = ProfileScreen();
            break;
          default:
            target = HomeScreen();
        }

        // Navigate without animation using PageRouteBuilder
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => target,
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
      },
      child: Icon(
        icon,
        color: isSelected ? Colors.black : Colors.grey,
      ),
    );
  }
}
