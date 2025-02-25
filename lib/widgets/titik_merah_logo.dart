import 'package:flutter/material.dart';

class TitikMerahLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Use the logo from assets (Ensure it's in "assets/" and declared in pubspec.yaml)
        Image.asset(
          '../../assets/dark_titik_merah.png', // Change this to your actual filename
          height: 30, // Adjust height as needed
        ),
        SizedBox(width: 8),

        // "TitikMerah" Text with Different Colors
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Titik",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              TextSpan(
                text: "Merah",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.red),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
