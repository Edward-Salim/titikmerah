import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:titik_merah/model/category_model.dart';
import 'package:titik_merah/model/forum_post_model.dart';
import 'package:titik_merah/widgets/quick_report/institution/forum_post_dialog.dart';

class ForumPostWidget extends StatelessWidget {
  final ForumPost post;

  ForumPostWidget({required this.post});

  void _showPostDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ForumPostDialog(post: post), // Open the new dialog
    );
  }

  @override
  Widget build(BuildContext context) {
    final CategoryModel category = CategoryModel.getCategory(post.category);

    return GestureDetector(
      onTap: () => _showPostDialog(context), // Open dialog on tap
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            // Category Icon at Top Right
            Positioned(
              top: 4,
              right: 4,
              child: Icon(
                category.icon,
                size: 16,
                color: category.color,
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // Anonymous Profile Icon
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.3), // Light background
                      ),
                      child: Center(
                        child: Icon(
                          CupertinoIcons.person_solid, // Anonymous icon
                          size: 22,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),

                    // Forum Post Content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          Text(
                            post.title,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 2),

                          // Description (Truncated for UI balance)
                          Text(
                            post.description.length > 100
                                ? post.description.substring(0, 100) + "..."
                                : post.description,
                            style: TextStyle(fontSize: 12, color: Colors.white70),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // Post Time at the Bottom Right
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(top: 0.5), // Add spacing from the text
                    child: Text(
                      post.time,
                      style: TextStyle(fontSize: 12, color: Colors.white54),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
