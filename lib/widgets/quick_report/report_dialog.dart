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
    'Suap',
    'Gratifikasi',
    'Penyalahgunaan Wewenang',
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      title: Text(
        "Laporkan: ${widget.categoryLabel}",
        style: TextStyle(color: widget.categoryColor, fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Dropdown for Corruption Type
          DropdownButtonFormField<String>(
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

          // Optional Description Field
          TextField(
            controller: descriptionController,
            maxLines: 3,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Tambahkan deskripsi (opsional)",
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
            widget.onSubmit(selectedType ?? "Tidak Ditentukan", descriptionController.text);
            Navigator.pop(context);
          },
          child: Text("Kirim", style: TextStyle(color: widget.categoryColor)),
        ),
      ],
    );
  }
}
