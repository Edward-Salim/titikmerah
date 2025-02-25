import 'package:titik_merah/model/institution_model.dart';
import 'package:titik_merah/model/profile_model.dart';

class ForumPost {
  final String title;
  final String description; // Longer text
  final String time;
  final String category;
  final Profile profile; // One-to-Many: A profile can have many posts
  final Institution institution; // One-to-One: Each post is linked to one institution

  ForumPost({
    required this.title,
    required this.description,
    required this.time,
    required this.category,
    required this.profile,
    required this.institution,
  });

  // Convert from Map (for JSON or dummy data loading)
  factory ForumPost.fromMap(Map<String, dynamic> map) {
    return ForumPost(
      title: map["title"] ?? "",
      description: map["description"] ?? "",
      time: map["time"] ?? "",
      category: map["category"] ?? "",
      profile: Profile.fromMap(map["profile"] ?? {}),
      institution: Institution.fromMap(map["institution"] ?? {}),
    );
  }

  // Convert to Map (useful if saving to database or API)
  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "description": description,
      "time": time,
      "category": category,
      "profile": profile.toMap(),
      "institution": institution.toMap(),
    };
  }
}
