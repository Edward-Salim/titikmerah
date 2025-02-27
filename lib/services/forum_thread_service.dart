import 'package:titik_merah/model/dto/forum_thread_dto.dart';
import 'package:titik_merah/model/forum_thread_model.dart';
import 'package:titik_merah/data/forum_data.dart';
import 'package:uuid/uuid.dart';

class ForumThreadService {
  final List<ForumThread> _threads = [
    ...forumThreadsUser1,
    ...forumThreadsUser2,
    ...forumThreadsUser3,
  ];

  List<ForumThread> getAllThreads() => _threads;

  // Asynchronously fetch a thread by its ID
  Future<ForumThread?> getThreadById(String id) async {
    await Future.delayed(Duration(milliseconds: 300)); // Simulate async call
    try {
      return _threads.firstWhere((thread) => thread.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<void> createThread(ForumThreadDTO dto) async {
    await Future.delayed(Duration(milliseconds: 300)); // Simulate API delay

    final uuid = Uuid();
    final newThread = ForumThread(
      id: uuid.v4(),
      title: dto.title,
      description: dto.description,
      time: DateTime.now().toIso8601String(),
      profileId: "profile1", // Replace with authenticated user's profile ID
      category: dto.category,
      commentIds: [],
    );

    _threads.add(newThread);
  }
}
