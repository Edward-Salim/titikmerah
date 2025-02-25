import 'package:flutter/material.dart';
import 'package:titik_merah/data/alternative_institutions_data.dart';
import 'package:titik_merah/model/alternative_institution.dart';
import 'package:titik_merah/widgets/quick_report/alternative_institution_widget.dart';
import 'package:titik_merah/widgets/quick_report/info_dialog.dart';
import 'package:titik_merah/widgets/quick_report/new_post_dialog.dart';
import 'package:titik_merah/widgets/quick_report/quick_report_button.dart';

class QuickReportSection extends StatelessWidget {
  QuickReportSection();

  void _showDialog(BuildContext context, Widget dialogWidget) {
    showDialog(context: context, builder: (context) => dialogWidget);
  }

  @override
  Widget build(BuildContext context) {
    // Filter institutions that are within 3km
    final List<AlternativeInstitution> nearbyInstitutions =
        alternativeInstitutions.where((institution) => institution.distance < 3).toList();

    return Container(
      margin: EdgeInsets.only(bottom: 20, left: 5, right: 5),
      child: Column(
        children: [
          // Row containing Alternative Institution, "?" button & Add Chat button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Show Alternative Institution ONLY if it's within 3km
              if (nearbyInstitutions.isNotEmpty)
                AlternativeInstitutionWidget(
                  alternativeInstitution: nearbyInstitutions.first, // Display the first nearby institution
                ),

              Row(
                children: [
                  // Add Chat Button
                  IconButton(
                    icon: Icon(Icons.chat, color: Colors.white),
                    onPressed: () => _showDialog(context, NewPostDialog()),
                  ),

                  // "?" Button (Info)
                  IconButton(
                    icon: Icon(Icons.help_outline, color: Colors.white),
                    onPressed: () => _showDialog(context, InfoDialog()),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8), // Added space before QuickReportButtons

          // Quick Report Buttons in Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QuickReportButton(
                buttonColor: Colors.red,
                tooltipText: "🔴 Saya mengalami langsung tindakan korupsi.",
                categoryLabel: "🔴 Saya mengalami korupsi",
              ),
              QuickReportButton(
                buttonColor: Colors.yellow,
                tooltipText: "🟡 Saya melihat atau mencurigai korupsi.",
                categoryLabel: "🟡 Saya mencurigai korupsi",
              ),
              QuickReportButton(
                buttonColor: Colors.green,
                tooltipText: "🟢 Tidak ada indikasi korupsi.",
                categoryLabel: "🟢 Tidak ada indikasi korupsi",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
