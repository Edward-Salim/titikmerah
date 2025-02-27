class ForumThread {
  final String id;
  final String title;
  final String description;
  final String time;
  final String profileId; // ID of the profile that created the thread
  final String category;
  final List<String> commentIds; // IDs of comments in this thread

  ForumThread({
    required this.id,
    required this.title,
    required this.description,
    required this.time,
    required this.profileId,
    required this.category,
    this.commentIds = const [],
  });

  // Convert from Map
  factory ForumThread.fromMap(Map<String, dynamic> map) {
    return ForumThread(
      id: map["id"] ?? "",
      title: map["title"] ?? "",
      description: map["description"] ?? "",
      time: map["time"] ?? "",
      profileId: map["profileId"] ?? "",
      category: map["category"] ?? "",
      commentIds: List<String>.from(map["commentIds"] ?? []),
    );
  }

  // Convert to Map
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "time": time,
      "profileId": profileId,
      "category": category,
      "commentIds": commentIds,
    };
  }
}
