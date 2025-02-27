import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:titik_merah/services/institution_service.dart';
import 'package:titik_merah/services/forum_service.dart';
import 'package:titik_merah/widgets/custom_navbar.dart';
import 'package:titik_merah/widgets/quick_report/institution/forum_widget.dart';
import 'package:titik_merah/widgets/quick_report/institution/institution_widget.dart';
import 'package:titik_merah/widgets/quick_report/quick_report_bottom_section.dart';
import 'package:titik_merah/widgets/quick_report/report_dialog.dart';
import 'package:titik_merah/widgets/titik_merah_logo.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool reportSubmitted = false;
  int selectedIndex = 0;

  final InstitutionService _institutionService = InstitutionService();
  final ForumService _forumService = ForumService();

  void showReportDialog(String label, Color color) {
    if (reportSubmitted) {
      Fluttertoast.showToast(
        msg: "Anda hanya bisa melaporkan satu kali per hari.",
      );
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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false, // This removes the back button
        backgroundColor: Colors.black,
        elevation: 0,
        title: TitikMerahLogo(),
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Column(
            children: [
              // Removed the top Padding with TitikMerahLogo since it's now in the AppBar.
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 120),
                  child: Column(
                    children: [
                      // InstitutionWidget wrapped in a FutureBuilder using InstitutionService
                      FutureBuilder(
                        future: _institutionService.getInstitutionById("inst1"),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Text(
                              "Error: ${snapshot.error}",
                              style: TextStyle(color: Colors.white),
                            );
                          } else if (!snapshot.hasData ||
                              snapshot.data == null) {
                            return Text(
                              "No institution data",
                              style: TextStyle(color: Colors.white),
                            );
                          }
                          return InstitutionWidget(data: snapshot.data!);
                        },
                      ),
                      SizedBox(height: 20),
                      // ForumWidget wrapped in a FutureBuilder using ForumService
                      FutureBuilder(
                        future: _forumService.getForumById("forum1"),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Text(
                              "Error: ${snapshot.error}",
                              style: TextStyle(color: Colors.white),
                            );
                          } else if (!snapshot.hasData ||
                              snapshot.data == null) {
                            return Text(
                              "No forum data",
                              style: TextStyle(color: Colors.white),
                            );
                          }
                          return ForumWidget(forum: snapshot.data!);
                        },
                      ),
                      SizedBox(height: 45),
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
              padding: EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: Column(
                children: [
                  QuickReportBottomSection(),
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
