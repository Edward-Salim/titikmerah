class Profile {
  final String id;
  final String name;
  final String? phoneNumber; // Optional field
  final List<String> forumThreadIds; // IDs of threads created by this profile
  final List<String> forumCommentIds; // IDs of comments made by this profile

  Profile({
    required this.id,
    required this.name,
    this.phoneNumber,
    this.forumThreadIds = const [],
    this.forumCommentIds = const [],
  });

  // Convert from Map (useful for JSON or dummy data loading)
  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map["id"] ?? "",
      name: map["name"] ?? "Anonim",
      phoneNumber: map["phoneNumber"],
      forumThreadIds: List<String>.from(map["forumThreadIds"] ?? []),
      forumCommentIds: List<String>.from(map["forumCommentIds"] ?? []),
    );
  }

  // Convert to Map (useful for saving to database or API)
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "phoneNumber": phoneNumber,
      "forumThreadIds": forumThreadIds,
      "forumCommentIds": forumCommentIds,
    };
  }
}
