import 'package:flutter/material.dart';

class ReportDialog extends StatefulWidget {
  final String categoryLabel;
  final Color categoryColor;
  final Function(String, String?) onSubmit;

  ReportDialog({
    required this.categoryLabel,
    required this.categoryColor,
    required this.onSubmit,
  });

  @override
  _ReportDialogState createState() => _ReportDialogState();
}

class _ReportDialogState extends State<ReportDialog> {
  String? selectedType;
  TextEditingController descriptionController = TextEditingController();

  final List<String> corruptionTypes = [
    'Pungutan Liar (Pungli)',
    'Suap Mikro',
    'Gratifikasi',
    'Facilitation Payments',
    'Pemerasan',
    'Penyalahgunaan Wewenang',
  ];

  final Map<String, String> corruptionDescriptions = {
    'Pungutan Liar (Pungli)':
        'Tarikan biaya tidak resmi oleh petugas untuk layanan yang seharusnya gratis.',
    'Suap Mikro': 'Pemberian uang atau hadiah kecil untuk mempercepat layanan.',
    'Gratifikasi':
        'Hadiah atau imbalan kepada pejabat yang dapat memengaruhi keputusan.',
    'Facilitation Payments':
        'Pembayaran kecil untuk mempercepat proses birokrasi.',
    'Pemerasan':
        'Pejabat meminta imbalan dengan tekanan agar layanan diberikan.',
    'Penyalahgunaan Wewenang':
        'Pejabat menggunakan jabatannya untuk keuntungan pribadi.',
  };

  @override
  Widget build(BuildContext context) {
    bool isNoCorruption =
        widget.categoryLabel == "🟢 Tidak ada indikasi korupsi";

    return AlertDialog(
      backgroundColor: Colors.black,
      title: Text(
        isNoCorruption
            ? "🟢 Tidak ada indikasi korupsi, Laporkan!"
            : "${widget.categoryLabel}, Laporkan!",
        style:
            TextStyle(color: widget.categoryColor, fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Only show the dropdown if corruption is detected
          if (!isNoCorruption) ...[
            DropdownButtonFormField<String>(
              isExpanded: true, // Allow dropdown to fill available width
              dropdownColor: Colors.black,
              value: selectedType,
              decoration: InputDecoration(
                labelText: "Pilih jenis korupsi",
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white24),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              items: corruptionTypes.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type, style: TextStyle(color: Colors.white)),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedType = value;
                });
              },
            ),
            SizedBox(height: 12),
          ],

          // Show description for the selected corruption type, if applicable
          if (!isNoCorruption && selectedType != null) ...[
            Text(
              corruptionDescriptions[selectedType]!,
              style: TextStyle(color: Colors.white70, fontSize: 14),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 12),
          ],

          // Optional description or note field
          TextField(
            controller: descriptionController,
            maxLines: 3,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: isNoCorruption
                  ? "Tambahkan catatan (opsional)"
                  : "Tambahkan deskripsi (opsional)",
              hintStyle: TextStyle(color: Colors.white60),
              filled: true,
              fillColor: Colors.white24,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Batal", style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () {
            widget.onSubmit(
              isNoCorruption
                  ? "Tidak ada indikasi korupsi"
                  : (selectedType ?? "Tidak Ditentukan"),
              descriptionController.text,
            );
            Navigator.pop(context);
          },
          child: Text("Kirim", style: TextStyle(color: widget.categoryColor)),
        ),
      ],
    );
  }
}
