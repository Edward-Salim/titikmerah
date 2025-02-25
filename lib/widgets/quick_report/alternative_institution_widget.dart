import 'package:flutter/material.dart';
import 'package:titik_merah/model/alternative_institution.dart';

class AlternativeInstitutionWidget extends StatelessWidget {
  final AlternativeInstitution alternativeInstitution; // Now uses model

  AlternativeInstitutionWidget({required this.alternativeInstitution});

  @override
  Widget build(BuildContext context) {
    return Flexible( // Prevents overflow and allows responsiveness
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(Icons.thumb_up, color: Colors.green, size: 20),
            SizedBox(width: 10),

            // Institution Name, Reports & Distance
            Expanded( // Prevents overflow and keeps text within available space
              child: Text(
                "Alternatif: ${alternativeInstitution.institutionName} • ${alternativeInstitution.reportCount} laporan • ${alternativeInstitution.distance.toStringAsFixed(1)} km",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                overflow: TextOverflow.ellipsis, // Ensures text does not overflow
              ),
            ),
          ],
        ),
      ),
    );
  }
}
