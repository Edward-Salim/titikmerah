import 'package:flutter/material.dart';
import 'package:titik_merah/widgets/otp_box.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phone;

  OtpVerificationScreen({required this.phone});

  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  List<String> otpValues = List.filled(4, "");

  void _updateOtpValue(String value, int index) {
    setState(() {
      otpValues[index] = value;
    });

    if (value.isNotEmpty && index < 3) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    }

    // If OTP is filled, navigate to home
    if (isOtpFilled) {
      Future.delayed(Duration(milliseconds: 300), () {
        Navigator.pushReplacementNamed(context, '/home');
      });
    }
  }

  bool get isOtpFilled => otpValues.every((digit) => digit.isNotEmpty);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),

            // Title
            Text(
              'Enter code',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),

            // Subtitle
            Text(
              'We sent a verification code to your phone number\n${widget.phone}',
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            SizedBox(height: 30),

            // OTP Input Fields (Using OtpBox Component)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => OtpBox(
                  controller: _controllers[index],
                  focusNode: _focusNodes[index],
                  onChanged: (value) => _updateOtpValue(value, index),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Resend Code Option
            Center(
              child: TextButton(
                onPressed: () {
                  // Handle Resend OTP
                },
                child: Text(
                  "Didn't receive any code? Resend Code",
                  style: TextStyle(color: Colors.amber[200]),
                ),
              ),
            ),
            SizedBox(height: 30),

            // Continue Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isOtpFilled
                    ? () {
                        Navigator.pushReplacementNamed(context, '/home');
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isOtpFilled ? Colors.amber[200] : Colors.grey[800],
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 16,
                    color: isOtpFilled ? Colors.black : Colors.white54,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
