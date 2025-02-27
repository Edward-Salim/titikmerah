import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1) Painted background with a diagonal halftone overlay.
          CustomPaint(
            size: MediaQuery.of(context).size,
            painter: HalftoneBackgroundPainter(),
          ),

          // 2) Centered content: two text blocks with an image in between.
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Top text block
                  Text(
                    'Dari Kecil\ndibiarkan',
                    style: GoogleFonts.montserrat(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 24),

                  // The red transparent image in between
                  Image.asset(
                    'assets/titik_merah_transparent.png',
                    width: 150, // Adjust as needed
                  ),

                  SizedBox(height: 24),

                  // Bottom text block
                  Text(
                    'Korupsi jadi\nKebiasaan!',
                    style: GoogleFonts.montserrat(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A halftone background that blends from black to red, then black again.
class HalftoneBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 1) Vertical gradient: black -> deep red -> bright red -> deep red -> black
    final gradient = LinearGradient(
      colors: [
        Color(0xFF000000), // Black
        Color(0xFF7A0000), // Deep red
        Color(0xFFB70000), // Bright red
        Color(0xFF7A0000), // Deep red
        Color(0xFF000000), // Black
      ],
      stops: [0.0, 0.25, 0.5, 0.75, 1.0],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final paintBg = Paint()..shader = gradient.createShader(rect);
    canvas.drawRect(rect, paintBg);

    // 2) Diagonal (45°) halftone overlay.
    canvas.save();
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(-math.pi / 4); // -45 degrees
    canvas.translate(-size.width / 2, -size.height / 2);

    final dotPaint = Paint()..color = Colors.black.withOpacity(0.2);
    const double dotSpacing = 5.0;
    const double dotRadius = 2.0;

    final diagonalSize = size.width + size.height;
    for (double y = 0; y < diagonalSize; y += dotSpacing) {
      final offsetX = ((y ~/ dotSpacing) % 2 == 0) ? 0 : dotSpacing / 2;
      for (double x = 0; x < diagonalSize; x += dotSpacing) {
        canvas.drawCircle(Offset(x + offsetX, y), dotRadius, dotPaint);
      }
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
