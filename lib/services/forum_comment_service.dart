import 'package:titik_merah/data/forum_data.dart';
import 'package:titik_merah/model/dto/forum_comment_dto.dart';
import 'package:titik_merah/model/forum_comment_model.dart';
import 'package:uuid/uuid.dart';

class ForumCommentService {
  final List<ForumComment> _comments = [
    ...forumCommentsUser1,
    ...forumCommentsUser2,
    ...forumCommentsUser3,
  ];

  List<ForumComment> getAllComments() => _comments;

  Future<ForumComment?> getCommentById(String id) async {
    // Optional: simulate a delay (e.g., API call)
    await Future.delayed(Duration(milliseconds: 300));
    try {
      return _comments.firstWhere((c) => c.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<void> createComment(ForumCommentDTO dto, String threadId) async {
    // Simulate API delay.
    await Future.delayed(Duration(milliseconds: 300));

    // Create a new ForumComment instance.
    final uuid = Uuid();
    final newComment = ForumComment(
      id: uuid.v4(),
      text: dto.text,
      time: DateTime.now().toIso8601String(),
      profileId: "profile1", // Replace with the authenticated user's profile ID
      threadId: threadId,
    );

    _comments.add(newComment);
  }
}
