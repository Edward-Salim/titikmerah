import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:titik_merah/model/institution_score_model.dart';
import 'package:titik_merah/widgets/common/inline_report_stats.dart';

/// Komponen dialog untuk menampilkan detail skor dan penjelasan poin.
class ScoreDialog extends StatelessWidget {
  final InstitutionScore institutionScore;

  const ScoreDialog({
    Key? key,
    required this.institutionScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      title: Text(
        "Report Stats",
        style: GoogleFonts.montserrat(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InlineReportStats(
            redCount: institutionScore.institution.redReports,
            yellowCount: institutionScore.institution.yellowReports,
            greenCount: institutionScore.institution.greenReports,
          ),
          const SizedBox(height: 12),
          Text(
            "Penjelasan Poin:",
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("• ",
                  style: GoogleFonts.montserrat(
                      color: Colors.white70, fontSize: 14)),
              Expanded(
                child: Text(
                  "Merah = -2",
                  style: GoogleFonts.montserrat(
                      color: Colors.white70, fontSize: 14),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("• ",
                  style: GoogleFonts.montserrat(
                      color: Colors.white70, fontSize: 14)),
              Expanded(
                child: Text(
                  "Kuning = -1",
                  style: GoogleFonts.montserrat(
                      color: Colors.white70, fontSize: 14),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("• ",
                  style: GoogleFonts.montserrat(
                      color: Colors.white70, fontSize: 14)),
              Expanded(
                child: Text(
                  "Hijau = +1",
                  style: GoogleFonts.montserrat(
                      color: Colors.white70, fontSize: 14),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Close",
            style: GoogleFonts.montserrat(
              color: Colors.lightBlueAccent,
            ),
          ),
        ),
      ],
    );
  }
}
