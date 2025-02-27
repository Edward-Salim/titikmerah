import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:titik_merah/widgets/leaderboard/score_dialog.dart';

class TopThreeItem extends StatelessWidget {
  final int rank;
  final dynamic institutionScore;
  final bool isCenter;
  final bool showClean;

  const TopThreeItem({
    Key? key,
    required this.rank,
    required this.institutionScore,
    this.isCenter = false,
    required this.showClean,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Jika tidak ada data, tampilkan kosong.
    if (institutionScore == null) {
      return const SizedBox.shrink();
    }

    // Mengambil nilai dari data model.
    final name = institutionScore.institution.institutionName;
    final score = institutionScore.score;

    // Hitung tinggi bar: (4 - rank) * 50.0 dengan tinggi minimal 100.
    final double calculatedHeight = (4 - rank) * 50.0;
    final double barHeight = max(calculatedHeight, 100);

    // Pilih warna bar berdasarkan posisi dan mode.
    final Color barColor = isCenter
        ? (showClean ? Colors.greenAccent : Colors.red.shade900)
        : (showClean ? Colors.green[100]! : Colors.red[100]!);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Rank with star background.
        Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.star, color: Colors.amber, size: isCenter ? 50 : 45),
            Text(
              rank.toString(),
              style: GoogleFonts.montserrat(
                fontSize: isCenter ? 18 : 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        // Wrap the Container in a FittedBox to prevent overflow.
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            width: isCenter ? 150 : 140,
            height: barHeight,
            decoration: BoxDecoration(
              color: barColor,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Score that shows a dialog on tap.
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) =>
                          ScoreDialog(institutionScore: institutionScore),
                    );
                  },
                  child: Tooltip(
                    message: "Klik untuk melihat detail poin",
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '$score',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),
                // Institution name with overflow handling.
                Flexible(
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: isCenter ? 14 : 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
