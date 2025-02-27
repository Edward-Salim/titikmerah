import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:titik_merah/model/category_model.dart';
import 'package:titik_merah/model/dto/forum_comment_dto.dart';
import 'package:titik_merah/model/forum_thread_model.dart';
import 'package:titik_merah/model/forum_comment_model.dart';
import 'package:titik_merah/model/profile_model.dart';
import 'package:titik_merah/services/profile_service.dart';
import 'package:titik_merah/services/forum_comment_service.dart';
import 'package:titik_merah/widgets/common/common_badge.dart';
import 'package:titik_merah/widgets/quick_report/institution/forum_comment_widget.dart';

/// A dialog showing the details of a forum thread along with its comments and a form to add a new comment.
class ForumThreadDialog extends StatefulWidget {
  final ForumThread thread;
  final List<ForumComment> comments;

  ForumThreadDialog({
    required this.thread,
    required this.comments,
  });

  @override
  _ForumThreadDialogState createState() => _ForumThreadDialogState();
}

class _ForumThreadDialogState extends State<ForumThreadDialog> {
  final ProfileService _profileService = ProfileService();
  final ForumCommentService _commentService = ForumCommentService();
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  /// Called when the send button is pressed.
  void _sendComment() async {
    final text = _commentController.text.trim();
    if (text.isEmpty) return;

    // Create the DTO with the provided text.
    ForumCommentDTO dto = ForumCommentDTO(text: text);

    // Call the createComment method in ForumCommentService.
    // Pass the DTO and the current thread's ID.
    await _commentService.createComment(dto, widget.thread.id);

    // Clear the text field.
    _commentController.clear();

    // Optionally, refresh the comments list here.
    // For simplicity, we call setState to update the UI.
    setState(() {
      // In a real app, you might fetch updated comments from your backend.
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      title: Text(
        widget.thread.title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thread header with profile name (fetched via ProfileService).
            Row(
              children: [
                Icon(
                  CupertinoIcons.person_solid,
                  size: 20,
                  color: Colors.white,
                ),
                SizedBox(width: 8),
                FutureBuilder<Profile?>(
                  future: _profileService.getProfileById(widget.thread.profileId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text(
                        "Loading...",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      );
                    } else if (snapshot.hasError || !snapshot.hasData) {
                      return Text(
                        "Unknown",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      );
                    } else {
                      return Text(
                        snapshot.data!.name,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 8),
            // Category badge (if available).
            if (widget.thread.category.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kategori:",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                  CommonBadge(
                    icon: CategoryModel.getCategory(widget.thread.category).icon,
                    color: CategoryModel.getCategory(widget.thread.category).color,
                    label: widget.thread.category,
                  ),
                  SizedBox(height: 8),
                ],
              ),
            // Thread description.
            Text(
              widget.thread.description,
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
            SizedBox(height: 12),
            Divider(color: Colors.white30),
            SizedBox(height: 8),
            // Comments header.
            Text(
              "Komentar:",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            // Render each comment using ForumCommentWidget.
            ...widget.comments
                .map((comment) => ForumCommentWidget(comment: comment))
                .toList(),
            SizedBox(height: 12),
            // The form for adding a new comment.
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Tulis komentar...",
                      hintStyle: TextStyle(color: Colors.white54),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _sendComment,
                  icon: Icon(Icons.send, color: Colors.lightBlueAccent),
                ),
              ],
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
