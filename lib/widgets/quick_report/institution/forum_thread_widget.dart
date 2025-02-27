import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:titik_merah/model/category_model.dart';
import 'package:titik_merah/model/forum_thread_model.dart';
import 'package:titik_merah/model/forum_comment_model.dart';
import 'package:titik_merah/services/forum_comment_service.dart';
import 'package:titik_merah/services/profile_service.dart';
import 'package:titik_merah/widgets/common/profile_avatar.dart';
import 'package:titik_merah/widgets/quick_report/institution/forum_thread_dialog.dart';

class ForumThreadWidget extends StatelessWidget {
  final ForumThread thread;

  ForumThreadWidget({required this.thread});

  // Fetch comments for this thread using ForumCommentService.
  Future<List<ForumComment>> _fetchComments() async {
    final ForumCommentService _commentService = ForumCommentService();
    List<ForumComment?> comments = await Future.wait(
      thread.commentIds.map((commentId) async {
        return await _commentService.getCommentById(commentId);
      }),
    );
    return comments.whereType<ForumComment>().toList();
  }

  void _showThreadDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => FutureBuilder<List<ForumComment>>(
        future: _fetchComments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return AlertDialog(
              backgroundColor: Colors.black,
              title: Text("Error", style: TextStyle(color: Colors.white)),
              content: Text("Failed to load comments.", style: TextStyle(color: Colors.white70)),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Close", style: TextStyle(color: Colors.white)),
                ),
              ],
            );
          }

          final comments = snapshot.data ?? [];
          return ForumThreadDialog(thread: thread, comments: comments);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final CategoryModel? category = CategoryModel.getCategory(thread.category);

    return GestureDetector(
      onTap: () => _showThreadDialog(context),
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            // Display category icon if available.
            if (category != null)
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
                    // Use a FutureBuilder to fetch profile details and show the avatar.
                    FutureBuilder(
                      future: ProfileService().getProfileById(thread.profileId),
                      builder: (context, snapshot) {
                        String? phoneNumber;
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          // While loading, display default (unverified) avatar.
                          return ProfileAvatar(phoneNumber: null);
                        } else if (snapshot.hasError || !snapshot.hasData) {
                          // In case of error, also fallback to default.
                          return ProfileAvatar(phoneNumber: null);
                        } else {
                          phoneNumber = snapshot.data!.phoneNumber;
                          return ProfileAvatar(phoneNumber: phoneNumber);
                        }
                      },
                    ),
                    SizedBox(width: 12),
                    // Thread content: title and description.
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            thread.title,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 2),
                          Text(
                            thread.description.length > 100
                                ? thread.description.substring(0, 100) + "..."
                                : thread.description,
                            style: TextStyle(fontSize: 12, color: Colors.white70),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Display the post time.
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Text(
                      thread.time,
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
