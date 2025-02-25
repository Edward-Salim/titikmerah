import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:titik_merah/model/category_model.dart';
import 'package:titik_merah/model/forum_post_model.dart';
import 'package:titik_merah/widgets/common_badge.dart';

class ForumPostDialog extends StatelessWidget {
  final ForumPost post;

  ForumPostDialog({required this.post});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      title: Text(
        post.title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(CupertinoIcons.person_solid, size: 20, color: Colors.white), // Profile icon
              SizedBox(width: 8),
              Text(
                post.profile.name, // Show name only in dialog
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 8),

          Text(
            "Kategori:",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white70),
          ),
          CommonBadge(
            icon: CategoryModel.getCategory(post.category).icon,
            color: CategoryModel.getCategory(post.category).color,
            label: post.category, // Show full category label
          ),
          SizedBox(height: 8),

          Text(
            post.description, // Full description
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
          SizedBox(height: 12),

          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              post.time,
              style: TextStyle(fontSize: 12, color: Colors.white54),
            ),
          ),
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
