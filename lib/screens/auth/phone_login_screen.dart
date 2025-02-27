import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:titik_merah/screens/auth/otp_verification_screen.dart';

class PhoneLoginScreen extends StatefulWidget {
  @override
  _PhoneLoginScreenState createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  bool isButtonEnabled = false;

  void _validateInput(String input) {
    setState(() {
      isButtonEnabled = input.length >= 10; // Assuming 10+ digits for a valid number
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark theme background
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
              'Lanjutkan dengan Nomor Telepon',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),

            // Subtitle
            Text(
              'Masukkan nomor telepon Anda untuk masuk.',
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            SizedBox(height: 30),

            // Phone Number Input
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly, // Allow only numbers
              ],
              onChanged: _validateInput,
              decoration: InputDecoration(
                labelText: '+62...',
                labelStyle: TextStyle(color: Colors.white54),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.white30),
                ),
                filled: true,
                fillColor: Colors.black,
              ),
            ),
            SizedBox(height: 20),

            // Continue Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isButtonEnabled
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OtpVerificationScreen(phone: _phoneController.text)),
                        );
                      }
                    : null, // Disable button when empty
                style: ElevatedButton.styleFrom(
                  backgroundColor: isButtonEnabled ? Colors.amber[200] : Colors.grey[800],
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Lanjutkan',
                  style: TextStyle(
                    fontSize: 16,
                    color: isButtonEnabled ? Colors.black : Colors.white54,
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
