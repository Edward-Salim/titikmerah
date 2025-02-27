import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:titik_merah/services/institution_service.dart';
import 'package:titik_merah/widgets/custom_navbar.dart';
import 'package:titik_merah/widgets/leaderboard/leaderboard_row.dart';
import 'package:titik_merah/widgets/leaderboard/top_three_item.dart';
import 'package:titik_merah/widgets/leaderboard/leaderboard_toggle.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  final InstitutionService _institutionService = InstitutionService();

  /// true => "Paling Bersih" (descending by score, show green)
  /// false => "Paling Korup" (ascending by score, show red)
  bool showClean = true;

  /// For the bottom navbar, we assume this screen is at index 1.
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    // Decide which colors to use based on `showClean`
    final List<Color> waveColors = showClean
        ? [Colors.green, Colors.lightGreen]
        : [Colors.red, Colors.redAccent];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Leaderboard Instansi',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: selectedIndex,
        onItemTapped: (index) {
          // TODO: Navigate to the correct screen if desired
        },
      ),
      body: Stack(
        children: [
          _buildWaveBackground(context, waveColors),
          Column(
            children: [
              const SizedBox(height: 8),
              LeaderboardToggle(
                showClean: showClean,
                onToggle: (newValue) {
                  setState(() {
                    showClean = newValue;
                  });
                },
              ),
              const SizedBox(height: 8),
              Expanded(
                child: FutureBuilder(
                  future: _institutionService.getSortedInstitutions(showClean),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          'Error: ${snapshot.error}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text(
                          'Tidak ada data instansi.',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }

                    final scoredInstitutions = snapshot.data!;
                    return _buildLeaderboardContent(scoredInstitutions);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWaveBackground(BuildContext context, List<Color> waveColors) {
    return ClipPath(
      clipper: _WaveClipper(),
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: waveColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }

  Widget _buildLeaderboardContent(List<dynamic> scoredInstitutions) {
    if (scoredInstitutions.length < 3) {
      return ListView.builder(
        itemCount: scoredInstitutions.length,
        itemBuilder: (context, index) {
          final item = scoredInstitutions[index];
          final rank = index + 1;
          return LeaderboardRow(rank: rank, institutionScore: item);
        },
      );
    }

    final topThree = scoredInstitutions.take(3).toList();
    final others = scoredInstitutions.skip(3).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: TopThreeItem(
                  rank: 2,
                  institutionScore: topThree.length > 1 ? topThree[1] : null,
                  showClean: showClean,
                ),
              ),
              Flexible(
                child: TopThreeItem(
                  rank: 1,
                  institutionScore: topThree.isNotEmpty ? topThree[0] : null,
                  isCenter: true,
                  showClean: showClean,
                ),
              ),
              Flexible(
                child: TopThreeItem(
                  rank: 3,
                  institutionScore: topThree.length > 2 ? topThree[2] : null,
                  showClean: showClean,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: others.length,
            itemBuilder: (context, index) {
              final item = others[index];
              final rank = index + 4;
              return LeaderboardRow(
                rank: rank,
                institutionScore: item,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, size.height * 0.6)
      ..quadraticBezierTo(
        size.width * 0.25,
        size.height * 0.75,
        size.width * 0.5,
        size.height * 0.6,
      )
      ..quadraticBezierTo(
        size.width * 0.75,
        size.height * 0.45,
        size.width,
        size.height * 0.6,
      )
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(_WaveClipper oldClipper) => false;
}
