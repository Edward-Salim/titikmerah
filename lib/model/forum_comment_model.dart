class ForumComment {
  final String id;
  final String text;
  final String time;
  final String profileId; // ID of the profile that made this comment
  final String threadId;  // ID of the thread to which this comment belongs

  ForumComment({
    required this.id,
    required this.text,
    required this.time,
    required this.profileId,
    required this.threadId,
  });

  // Convert from Map
  factory ForumComment.fromMap(Map<String, dynamic> map) {
    return ForumComment(
      id: map["id"] ?? "",
      text: map["text"] ?? "",
      time: map["time"] ?? "",
      profileId: map["profileId"] ?? "",
      threadId: map["threadId"] ?? "",
    );
  }

  // Convert to Map
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "text": text,
      "time": time,
      "profileId": profileId,
      "threadId": threadId,
    };
  }
}
