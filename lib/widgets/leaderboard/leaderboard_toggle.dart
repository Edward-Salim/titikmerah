import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeaderboardToggle extends StatelessWidget {
  final bool showClean;
  final ValueChanged<bool> onToggle;

  const LeaderboardToggle({
    Key? key,
    required this.showClean,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color activeColor = showClean ? Colors.green : Colors.red;
    return Container(
      decoration: BoxDecoration(
        color: showClean ? Colors.green.shade50 : Colors.red.shade50,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSegment(
            label: "Paling Bersih",
            isActive: showClean,
            onTap: () => onToggle(true),
            activeColor: activeColor,
          ),
          _buildSegment(
            label: "Paling Korup",
            isActive: !showClean,
            onTap: () => onToggle(false),
            activeColor: activeColor,
          ),
        ],
      ),
    );
  }

  Widget _buildSegment({
    required String label,
    required bool isActive,
    required VoidCallback onTap,
    required Color activeColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: isActive ? activeColor : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: GoogleFonts.montserrat(
            color: isActive ? Colors.white : activeColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
