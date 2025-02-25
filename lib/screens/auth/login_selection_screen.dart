import 'package:flutter/material.dart';
import 'package:titik_merah/widgets/custom_button.dart';

class LoginSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark mode for privacy feel
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Image Grid Section (optional, but keeps the aesthetic)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildCircleImage('assets/image1.png'),
                      SizedBox(width: 10),
                      _buildCircleImage('assets/image2.png'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildCircleImage('assets/image3.png'),
                      SizedBox(width: 10),
                      _buildCircleImage('assets/image4.png'),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            // Title Text
            Text(
              'Get started',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),

            // Description Text
            Text(
              'Monitor and report petty corruption anonymously or with your phone number for credibility.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 30),

            // Anonymous Login Button
            CustomButton(
              text: 'Use App Anonymously',
              icon: Icons.visibility_off,
              backgroundColor: Colors.grey[850]!,
              textColor: Colors.white,
              onPressed: () {
                // Handle anonymous login
                Navigator.pushNamed(context, '/home');
              },
            ),

            SizedBox(height: 16),

            // Phone Login Button
            CustomButton(
              text: 'Login with Phone Number',
              icon: Icons.phone,
              backgroundColor: Colors.white,
              textColor: Colors.black,
              onPressed: () {
                // Handle phone login
                Navigator.pushNamed(context, '/phoneLogin');
              },
            ),

            SizedBox(height: 20),

            // Privacy Notice
            Text(
              'We ensure your privacy. No metadata or personal info is stored.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build circular images
  Widget _buildCircleImage(String imagePath) {
    return ClipOval(
      child: Image.asset(
        imagePath,
        width: 80,
        height: 80,
        fit: BoxFit.cover,
      ),
    );
  }
}
