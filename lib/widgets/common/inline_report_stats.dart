// inline_report_stats.dart
import 'package:flutter/material.dart';

class InlineReportStats extends StatelessWidget {
  final int redCount;
  final int yellowCount;
  final int greenCount;

  const InlineReportStats({
    Key? key,
    required this.redCount,
    required this.yellowCount,
    required this.greenCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStat("🔴", redCount, Colors.red),
        const SizedBox(width: 10),
        _buildStat("🟡", yellowCount, Colors.yellow),
        const SizedBox(width: 10),
        _buildStat("🟢", greenCount, Colors.green),
      ],
    );
  }

  Widget _buildStat(String emoji, int count, Color color) {
    return Row(
      children: [
        Text(
          emoji,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(width: 4),
        Text(
          "$count",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
