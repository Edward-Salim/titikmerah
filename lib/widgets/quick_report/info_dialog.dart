import 'package:flutter/material.dart';

class InfoDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      title: Text(
        "Kategori Laporan",
        style: TextStyle(color: Colors.white),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "🔴 Merah – Saya atau kerabat saya mengalami secara langsung tindakan korupsi di lokasi ini setidaknya satu kali. Tindakan tersebut dapat berupa pungutan liar (pungli), suap, gratifikasi, atau bentuk lain dari penyalahgunaan wewenang. Saya yakin bahwa kejadian ini benar-benar terjadi dan dapat mengonfirmasi bahwa praktik tersebut berlangsung di tempat ini.",
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(height: 12),
            Text(
              "🟡 Kuning – Saya melihat, mendengar, atau mengalami situasi yang mengindikasikan adanya potensi korupsi di lokasi ini, tetapi saya tidak sepenuhnya yakin apakah hal tersebut benar-benar termasuk dalam kategori korupsi. Bisa jadi saya mengalami langsung tetapi masih ragu-ragu, atau saya hanya mendapatkan informasi dari orang lain tanpa bukti yang cukup kuat untuk memastikan kebenarannya.",
              style: TextStyle(color: Colors.yellow),
            ),
            SizedBox(height: 12),
            Text(
              "🟢 Hijau – Sepanjang pengalaman saya di lokasi ini, tidak ada indikasi pungutan liar, suap, atau bentuk korupsi lainnya. Saya dapat mengurus administrasi atau layanan publik dengan lancar sesuai prosedur resmi tanpa mengalami hambatan yang mencurigakan. Tempat ini tampak bersih dari praktik korupsi sejauh yang saya alami dan amati.",
              style: TextStyle(color: Colors.green),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Tutup", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
