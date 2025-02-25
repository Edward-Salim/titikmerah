import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:titik_merah/data/institution_data.dart';
import 'package:titik_merah/widgets/custom_navbar.dart';
import 'package:titik_merah/widgets/quick_report/institution/forum_widget.dart';
import 'package:titik_merah/widgets/quick_report/institution/institution_risk_widget.dart';
import 'package:titik_merah/widgets/quick_report/quick_report_section.dart';
import 'package:titik_merah/widgets/quick_report/report_dialog.dart';
import 'package:titik_merah/widgets/titik_merah_logo.dart'; // Import logo widget

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool reportSubmitted = false;
  int selectedIndex = 0;

  void showReportDialog(String label, Color color) {
    if (reportSubmitted) {
      Fluttertoast.showToast(
          msg: "Anda hanya bisa melaporkan satu kali per hari.");
      return;
    }

    showDialog(
      context: context,
      builder: (context) => ReportDialog(
        categoryLabel: label,
        categoryColor: color,
        onSubmit: (corruptionType, description) {
          setState(() {
            reportSubmitted = true;
          });
          Fluttertoast.showToast(msg: "Laporan berhasil dikirim!");
        },
      ),
    );
  }

  void onNavBarItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Check if the current institution has high corruption risk
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6), BlendMode.darken),
              ),
            ),
          ),

          Column(
            children: [
              // Top Section with Logo
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: TitikMerahLogo(), // Add the logo here
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                      bottom: 120), // Ensure spacing for sticky footer
                  child: Column(
                    children: [
                      // Institution Risk Widget
                      InstitutionRiskWidget(data: institutionsDummyData[0]),
                      SizedBox(height: 20),

                      // Scrollable Forum Widget
                      ForumWidget(),

                      SizedBox(height: 65),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Sticky Footer (Quick Report Section & NavBar)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: 12, vertical: 8), // Adds margin around the footer
              padding: EdgeInsets.only(
                  top: 8, bottom: 8), // Adds spacing between Forum and footer
              decoration: BoxDecoration(
                color: Colors.black, // Solid background (not see-through)
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12)), // Rounded corners at the top
              ),
              child: Column(
                children: [
                  QuickReportSection(),
                  SizedBox(height: 8), // Space between sections
                  CustomNavBar(
                    selectedIndex: selectedIndex,
                    onItemTapped: onNavBarItemTapped,
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
