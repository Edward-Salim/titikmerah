import 'package:titik_merah/model/forum_comment_model.dart';
import 'package:titik_merah/model/forum_model.dart';
import 'package:titik_merah/model/forum_thread_model.dart';

// --- Forum Comments ---
// Comments created by Anonim User 1 (belongs to thread1)
final List<ForumComment> forumCommentsUser1 = [
  ForumComment(
    id: "comment1",
    text:
        "Saya mengalami pungli saat mengurus STNK di Samsat. Petugas meminta Rp200 ribu untuk mempercepat antrian.",
    time: "12 min",
    profileId: "profile1",
    threadId: "thread1",
  ),
  ForumComment(
    id: "comment2",
    text: "Ada ide lain untuk melaporkan hal ini?",
    time: "10 min",
    profileId: "profile1",
    threadId: "thread1",
  ),
];

// Comments created by Anonim User 2 (belongs to thread2)
final List<ForumComment> forumCommentsUser2 = [
  ForumComment(
    id: "comment3",
    text: "Pengalaman saya berbeda, saya tidak diminta pungli.",
    time: "20 min",
    profileId: "profile2",
    threadId: "thread2",
  ),
];

// Comments created by Anonim User 3 (belongs to thread3)
final List<ForumComment> forumCommentsUser3 = [
  ForumComment(
    id: "comment4",
    text: "Layanan sudah berubah, lebih ramah dan cepat.",
    time: "5 min",
    profileId: "profile3",
    threadId: "thread3",
  ),
];

// --- Forum Threads ---
// Threads created by Anonim User 1
final List<ForumThread> forumThreadsUser1 = [
  ForumThread(
    id: "thread1",
    title: "Korupsi di Samsat?",
    description:
        "Apakah normal diminta Rp200 ribu untuk mempercepat proses STNK?",
    time: "1 hour ago",
    profileId: "profile1",
    category: "Korupsi",
    commentIds: ["comment1", "comment2"],
  ),
];

// Threads created by Anonim User 2
final List<ForumThread> forumThreadsUser2 = [
  ForumThread(
    id: "thread2",
    title: "Tips Urus SIM Tanpa Pungli",
    description: "Ikuti prosedur resmi dan hindari pembayaran calo.",
    time: "2 days ago",
    profileId: "profile2",
    category: "Update",
    commentIds: ["comment3"],
  ),
];

// Threads created by Anonim User 3
final List<ForumThread> forumThreadsUser3 = [
  ForumThread(
    id: "thread3",
    title: "Apakah Ada Perubahan Layanan?",
    description:
        "Setelah banyak laporan, apakah layanan sudah membaik di kantor ini?",
    time: "5 days ago",
    profileId: "profile3",
    category: "Layanan",
    commentIds: ["comment4"],
  ),
];

// --- Forums (Grouping Threads by Institution) ---
final List<Forum> forumDummyData = [
  Forum(
    id: "forum1",
    institutionId: "inst1",
    threadIds: ["thread1", "thread2"],
  ),
  Forum(
    id: "forum2",
    institutionId: "inst2",
    threadIds: ["thread3"],
  ),
];
