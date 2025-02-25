import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark background
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Centered Column for Text & Image
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Solid\nFoundations\nfor Your Crypto\nFuture',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
              ),
            ],
          ),

          // Positioned Red 3D Illustration
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: CustomPaint(
                size: Size(200, 250),
                painter: SplashPainter(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Painter for the Red Sphere & Cylinder Illustration
class SplashPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..shader = RadialGradient(
      colors: [Colors.red, Colors.deepOrange, Colors.black],
      radius: 0.7,
    ).createShader(Rect.fromCircle(center: Offset(size.width / 2, 50), radius: 50));

    // Draw the Cylinder
    final Rect cylinder = Rect.fromLTWH(0, 50, size.width, size.height - 50);
    final Paint cylinderPaint = Paint()
      ..shader = LinearGradient(
        colors: [Colors.red, Colors.deepOrange, Colors.black],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(cylinder);

    canvas.drawOval(cylinder, cylinderPaint);

    // Draw the Sphere on Top
    final Offset sphereCenter = Offset(size.width / 2, 50);
    canvas.drawCircle(sphereCenter, 50, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
