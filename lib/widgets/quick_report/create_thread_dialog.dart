import 'package:flutter/material.dart';
import 'package:titik_merah/model/dto/forum_thread_dto.dart';
import 'package:titik_merah/model/category_model.dart';
import 'package:titik_merah/services/forum_thread_service.dart';

class CreateThreadDialog extends StatefulWidget {
  @override
  _CreateThreadDialogState createState() => _CreateThreadDialogState();
}

class _CreateThreadDialogState extends State<CreateThreadDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _selectedCategory =
      CategoryModel.categories.first.name; // Default category

  // Instance of ForumThreadService; in a real app, you might inject this.
  final ForumThreadService _threadService = ForumThreadService();

  Future<void> _addNewThread() async {
    if (_formKey.currentState!.validate()) {
      // Create the DTO
      final dto = ForumThreadDTO(
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        category: _selectedCategory,
      );

      // Call the service to create a new thread
      await _threadService.createThread(dto);

      // Clear inputs and close dialog
      _titleController.clear();
      _descriptionController.clear();
      Navigator.pop(context);
    }
  }

  InputDecoration _buildInputDecoration(String label, String hint) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.white70),
      hintText: hint,
      hintStyle: TextStyle(color: Colors.white54),
      filled: true,
      fillColor: Colors.white12,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white30),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.lightBlueAccent),
        borderRadius: BorderRadius.circular(8),
      ),
      errorStyle: TextStyle(color: Colors.redAccent),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      title: Text(
        "Tambah Thread Baru",
        style: TextStyle(color: Colors.white),
      ),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title input
              TextFormField(
                controller: _titleController,
                style: TextStyle(color: Colors.white),
                decoration:
                    _buildInputDecoration("Judul", "Masukkan judul thread"),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Judul tidak boleh kosong";
                  }
                  return null;
                },
              ),
              SizedBox(height: 12),
              // Description input
              TextFormField(
                controller: _descriptionController,
                style: TextStyle(color: Colors.white),
                maxLines: 3,
                decoration: _buildInputDecoration(
                    "Deskripsi", "Tuliskan deskripsi thread"),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Deskripsi tidak boleh kosong";
                  }
                  return null;
                },
              ),
              SizedBox(height: 12),
              // Category Dropdown
              DropdownButtonFormField<String>(
                dropdownColor: Colors.black,
                style: TextStyle(color: Colors.white),
                value: _selectedCategory,
                items: CategoryModel.categories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category.name,
                    child: Row(
                      children: [
                        Icon(category.icon, size: 16, color: category.color),
                        SizedBox(width: 8),
                        Text(category.name,
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
                decoration:
                    _buildInputDecoration("Kategori", "Pilih kategori thread"),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Batal", style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: _addNewThread,
          child:
              Text("Tambah", style: TextStyle(color: Colors.lightBlueAccent)),
        ),
      ],
    );
  }
}
