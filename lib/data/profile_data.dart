import 'package:titik_merah/model/profile_model.dart';

final List<Profile> profileDummyData = [
  Profile(
    id: "profile1",
    name: "Anonim User 1",
    phoneNumber: null,
    forumThreadIds: ["thread1"],
    forumCommentIds: ["comment1", "comment2"],
  ),
  Profile(
    id: "profile2",
    name: "Anonim User 2",
    phoneNumber: "081234567890",
    forumThreadIds: ["thread2"],
    forumCommentIds: ["comment3"],
  ),
  Profile(
    id: "profile3",
    name: "Anonim User 3",
    phoneNumber: null,
    forumThreadIds: ["thread3"],
    forumCommentIds: ["comment4"],
  ),
];
