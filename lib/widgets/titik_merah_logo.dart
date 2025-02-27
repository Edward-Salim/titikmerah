import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitikMerahLogo extends StatelessWidget {
  const TitikMerahLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Make sure "assets/dark_titik_merah.png" is declared in pubspec.yaml
        Image.asset(
          'assets/dark_titik_merah.png', // Update to your actual asset path
          height: 18, // Slightly larger for better visibility
        ),
        const SizedBox(width: 4),

        // "TitikMerah" text with Montserrat font
        RichText(
          text: TextSpan(
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            children: const [
              TextSpan(
                text: "Titik",
                style: TextStyle(color: Colors.white),
              ),
              TextSpan(
                text: "Merah",
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
