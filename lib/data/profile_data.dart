// Dummy profiles
import 'package:titik_merah/data/forum_posts_data.dart';
import 'package:titik_merah/model/profile_model.dart';

final List<Profile> profileDummyData = [
  Profile(
    name: "Anonim User 1",
    phoneNumber: null,
    forumPosts: [forumPostsDummyData[0]], // Assign post
  ),
  Profile(
    name: "Anonim User 2",
    phoneNumber: "081234567890",
    forumPosts: [forumPostsDummyData[1]], // Assign post
  ),
  Profile(
    name: "Anonim User 3",
    phoneNumber: null,
    forumPosts: [forumPostsDummyData[2]], // Assign post
  ),
];
