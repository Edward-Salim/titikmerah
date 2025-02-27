import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:titik_merah/widgets/common/profile_avatar.dart';
import 'package:titik_merah/widgets/custom_navbar.dart';
import 'package:titik_merah/widgets/common/custom_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String userName = "Anonim";
  final String phoneNumber = "081234567890"; // Simulated phone number

  int selectedIndex = 2; // Profile is at index 2

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Profil Pengguna',  
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
      ),

      bottomNavigationBar: CustomNavBar(
        selectedIndex: selectedIndex,
        onItemTapped: (index) {
          setState(() => selectedIndex = index);
          switch (index) {
            case 0:
              Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
              break;
            case 1:
              Navigator.pushNamedAndRemoveUntil(context, '/leaderboard', (route) => false);
              break;
            case 2:
              break; // Stay on Profile
          }
        },
      ),

      body: Column(
        children: [
          // Top Profile Section with rounded bottom
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              // White container with rounded bottom
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(40),
                  ),
                ),
                padding: const EdgeInsets.only(top: 48, bottom: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60), // Space for avatar
                    // User Name
                    Text(
                      userName,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Phone Number
                    Text(
                      phoneNumber,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),

              // ProfileAvatar positioned above the white container
              Positioned(
                top: 20, // Moves the avatar slightly up
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withOpacity(0.5), // Transparent black background
                  ),
                  child: ProfileAvatar(phoneNumber: phoneNumber, size: 80),
                ),
              ),
            ],
          ),

          // Expanded black area with logout and disclaimer
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Disclaimer text
                  Text(
                    "Kami tidak menyimpan atau membagikan data pribadi Anda. Semua laporan yang dibuat bersifat anonim.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Logout Button using CustomButton
                  CustomButton(
                    text: "Logout",
                    onPressed: () => _logout(context),
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    icon: Icons.exit_to_app,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Handle logout and redirect to /login
  void _logout(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }
}
