import 'package:flutter/material.dart';
import 'package:titik_merah/data/forum_posts_data.dart';
import 'package:titik_merah/data/institution_data.dart';
import 'package:titik_merah/model/category_model.dart';
import 'package:titik_merah/model/forum_post_model.dart';
import 'package:titik_merah/model/profile_model.dart';

class NewPostDialog extends StatefulWidget {
  @override
  _NewPostDialogState createState() => _NewPostDialogState();
}

class _NewPostDialogState extends State<NewPostDialog> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _selectedCategory =
      CategoryModel.categories.first.name; // Default category

  void _addNewPost() {
    if (_titleController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty) {
      setState(() {
        forumPostsDummyData.add(
          ForumPost(
            title: _titleController.text,
            description: _descriptionController.text,
            time: "Baru saja",
            category: _selectedCategory,
            profile: Profile(name: "Anonymous"),
            institution: institutionsDummyData[0],
          ),
        );
        _titleController.clear();
        _descriptionController.clear();
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      title: Text(
        "Tambah Postingan Baru",
        style: TextStyle(color: Colors.white),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _titleController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: "Judul",
              labelStyle: TextStyle(color: Colors.white70),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white30),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.lightBlueAccent),
              ),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _descriptionController,
            style: TextStyle(color: Colors.white),
            maxLines: 3,
            decoration: InputDecoration(
              labelText: "Deskripsi",
              labelStyle: TextStyle(color: Colors.white70),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white30),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.lightBlueAccent),
              ),
            ),
          ),
          SizedBox(height: 10),

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
                    Text(category.name, style: TextStyle(color: Colors.white)),
                  ],
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedCategory = value!;
              });
            },
            decoration: InputDecoration(
              labelText: "Kategori",
              labelStyle: TextStyle(color: Colors.white70),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white30),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.lightBlueAccent),
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
          onPressed: _addNewPost,
          child:
              Text("Tambah", style: TextStyle(color: Colors.lightBlueAccent)),
        ),
      ],
    );
  }
}
