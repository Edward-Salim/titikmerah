import 'package:titik_merah/model/forum_post_model.dart';

class Profile {
  final String name;
  final String? phoneNumber; // Optional field
  final List<ForumPost> forumPosts; // One-to-Many: A profile has many forum posts

  Profile({
    required this.name,
    this.phoneNumber,
    this.forumPosts = const [], // Defaults to an empty list
  });

  // Convert from Map (useful for JSON or dummy data loading)
  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      name: map["name"] ?? "Anonim",
      phoneNumber: map["phoneNumber"],
      forumPosts: (map["forumPosts"] as List<dynamic>?)
              ?.map((post) => ForumPost.fromMap(post))
              .toList() ??
          [],
    );
  }

  // Convert to Map (useful for saving to database or API)
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "phoneNumber": phoneNumber,
      "forumPosts": forumPosts.map((post) => post.toMap()).toList(),
    };
  }
}
