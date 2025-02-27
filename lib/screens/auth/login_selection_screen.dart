import 'package:flutter/material.dart';
import 'package:titik_merah/widgets/common/custom_button.dart';

class LoginSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Mode gelap untuk kesan privasi
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Bagian Grid Gambar (opsional, untuk menjaga estetika)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildCircleImage('assets/titik_merah.png'),
                      SizedBox(width: 10),
                      _buildCircleImage('assets/titik_merah.png'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildCircleImage('assets/titik_merah.png'),
                      SizedBox(width: 10),
                      _buildCircleImage('assets/titik_merah.png'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            // Judul
            Text(
              'Berantas Sekarang',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            // Deskripsi
            Text(
              'Pantau dan laporkan korupsi kecil secara anonim atau dengan nomor telepon untuk meningkatkan kredibilitas.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 30),
            // Tombol Login Anonim
            CustomButton(
              text: 'Mode Anonim',
              icon: Icons.visibility_off,
              backgroundColor: Colors.grey[850]!,
              textColor: Colors.white,
              onPressed: () {
                // Tangani login anonim
                Navigator.pushNamed(context, '/home');
              },
            ),
            SizedBox(height: 16),
            // Tombol Login dengan Nomor Telepon
            CustomButton(
              text: 'Masuk dengan Nomor Telepon',
              icon: Icons.phone,
              backgroundColor: Colors.white,
              textColor: Colors.black,
              onPressed: () {
                // Tangani login dengan nomor telepon
                Navigator.pushNamed(context, '/phoneLogin');
              },
            ),
            SizedBox(height: 20),
            // Pemberitahuan Privasi
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.black,
                      title: Text(
                        "Syarat dan Ketentuan",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      content: SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height * 0.5,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dengan menggunakan aplikasi ini, Anda setuju untuk mematuhi syarat dan ketentuan berikut:",
                                style: TextStyle(color: Colors.white70, fontSize: 14),
                              ),
                              SizedBox(height: 10),
                              _buildBulletPoint("Aplikasi ini hanya digunakan untuk pelaporan korupsi kecil dan penyalahgunaan wewenang."),
                              _buildBulletPoint("Semua data yang dilaporkan akan diproses secara anonim untuk meningkatkan layanan."),
                              _buildBulletPoint("Anda bertanggung jawab atas keakuratan informasi yang Anda laporkan."),
                              _buildBulletPoint("Privasi Anda dijaga dengan ketat dan tidak akan dibagikan kepada pihak ketiga."),
                              _buildBulletPoint("Penggunaan aplikasi ini dianggap sebagai persetujuan terhadap syarat dan ketentuan yang berlaku."),
                            ],
                          ),
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            "Tutup",
                            style: TextStyle(color: Colors.lightBlueAccent),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                "Syarat dan Ketentuan",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.lightBlueAccent,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi pembantu untuk membuat gambar melingkar
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

  // Fungsi pembantu untuk membuat bullet point
  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("• ", style: TextStyle(color: Colors.white70, fontSize: 14)),
          Expanded(
            child: Text(text, style: TextStyle(color: Colors.white70, fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
