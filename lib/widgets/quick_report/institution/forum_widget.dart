import 'package:flutter/material.dart';
import 'package:titik_merah/data/forum_posts_data.dart';
import 'package:titik_merah/widgets/quick_report/institution/forum_post_widget.dart';

class ForumWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "💬 Forum Diskusi",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextButton(
                onPressed: () {}, // Add functionality to view all forums
                child: Text("Lihat Semua >",
                    style:
                        TextStyle(fontSize: 12, color: Colors.lightBlueAccent)),
              ),
            ],
          ),
          SizedBox(height: 6),

          // Forum Posts List
          Column(
            children: forumPostsDummyData.map((post) {
              return ForumPostWidget(post: post);
            }).toList(),
          ),
        ],
      ),
    );
  }
}
