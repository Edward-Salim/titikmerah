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
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("🔴 Merah – Mengalami korupsi langsung.", style: TextStyle(color: Colors.red)),
          Text("🟡 Kuning – Melihat atau mencurigai korupsi.", style: TextStyle(color: Colors.yellow)),
          Text("🟢 Hijau – Tidak ada indikasi korupsi.", style: TextStyle(color: Colors.green)),
        ],
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
