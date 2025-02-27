import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:titik_merah/model/alternative_institution.dart';

class AlternativeInstitutionWidget extends StatelessWidget {
  final AlternativeInstitution alternativeInstitution;

  const AlternativeInstitutionWidget({required this.alternativeInstitution, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const Icon(Icons.thumb_up, color: Colors.green, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: SizedBox(
                height: 20, // Set a fixed height to ensure the widget has a size
                child: Marquee(
                  text:
                      "Alternatif • ${alternativeInstitution.institutionName} • ${alternativeInstitution.reportCount} laporan • ${alternativeInstitution.distance.toStringAsFixed(1)} km • ",
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                  scrollAxis: Axis.horizontal,
                  blankSpace: 0.0,
                  velocity: 50.0,
                  pauseAfterRound: const Duration(seconds: 1),
                  startPadding: 10.0,
                  accelerationDuration: const Duration(seconds: 1),
                  accelerationCurve: Curves.linear,
                  decelerationDuration: const Duration(milliseconds: 500),
                  decelerationCurve: Curves.easeOut,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
