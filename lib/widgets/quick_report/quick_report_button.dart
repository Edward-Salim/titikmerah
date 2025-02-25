import 'package:flutter/material.dart';
import 'package:titik_merah/widgets/quick_report/report_dialog.dart';

class QuickReportButton extends StatelessWidget {
  final Color buttonColor;
  final String tooltipText;
  final String categoryLabel;

  QuickReportButton({
    required this.buttonColor,
    required this.tooltipText,
    required this.categoryLabel,
  });

  void _showReportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ReportDialog(
        categoryLabel: categoryLabel,
        categoryColor: buttonColor,
        onSubmit: (corruptionType, description) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Laporan berhasil dikirim!")),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _showReportDialog(context), // Open Report Dialog
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 14),
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: buttonColor, // Background matches category
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                color: Colors.white, // White dot for contrast
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
