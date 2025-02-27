import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:titik_merah/model/institution_model.dart';
import 'package:titik_merah/services/notification_service.dart';
import 'package:titik_merah/widgets/common/inline_report_stats.dart';
import 'package:titik_merah/widgets/quick_report/institution/small_info_widget.dart';

class InstitutionWidget extends StatelessWidget {
  final Institution data; // Accepts the full model

  InstitutionWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    // Trigger Notification for High-Risk Areas
    if (data.riskLevel == "Tinggi") {
      Future.delayed(Duration(seconds: 1), () {
        NotificationService.showRiskNotification();
      });
    }

    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: 12), // Adds margin to fit in a row
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1), // Light background
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white30), // Subtle border
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            CupertinoIcons.building_2_fill, // Institution icon
            size: 50,
            color: Colors.white,
          ),
          SizedBox(height: 10),

          // Highlighted Institution Name
          Text(
            data.institutionName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 6),

          // Highlighted Risk Level
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: data.riskColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "Tingkat Korupsi: ${data.riskLevel}",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 8),

          // Inline Report Stats using the new InlineReportStats widget
          InlineReportStats(
            redCount: data.redReports,
            yellowCount: data.yellowReports,
            greenCount: data.greenReports,
          ),
          SizedBox(height: 10),

          // Two-column layout for small info using SmallInfoWidget
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmallInfoWidget(text: "🏛️: ${data.institutionType}"),
              SmallInfoWidget(text: "📍: ${data.location}"),
            ],
          ),
        ],
      ),
    );
  }
}
