import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:titik_merah/model/institution_score_model.dart';
import 'package:titik_merah/widgets/leaderboard/score_dialog.dart';

/// Widget baris leaderboard yang menampilkan skor dan detail institusi.
class LeaderboardRow extends StatelessWidget {
  final int rank;
  final InstitutionScore institutionScore;

  const LeaderboardRow({
    Key? key,
    required this.rank,
    required this.institutionScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Tentukan label rank (angka atau emoji)
    String rankLabel;
    switch (rank) {
      case 1:
        rankLabel = '1';
        break;
      case 2:
        rankLabel = '2';
        break;
      case 3:
        rankLabel = '3';
        break;
      default:
        rankLabel = '$rank';
    }

    // Sorot baris untuk top 3.
    final Color rowColor = (rank <= 3) ? Colors.white10 : Colors.transparent;

    return Container(
      color: rowColor,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          // Rank
          SizedBox(
            width: 40,
            child: Text(
              rankLabel,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Avatar placeholder.
          const CircleAvatar(
            backgroundImage: AssetImage('assets/avatar_placeholder.png'),
            radius: 20,
          ),
          const SizedBox(width: 12),
          // Nama Institusi.
          Expanded(
            child: Text(
              institutionScore.institution.institutionName,
              style: GoogleFonts.montserrat(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Tombol skor dengan tooltip sebagai indikator klik.
          Tooltip(
            message: "Klik untuk melihat detail poin",
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) =>
                      ScoreDialog(institutionScore: institutionScore),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color:
                      institutionScore.score >= 0 ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  institutionScore.score.toString(),
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
