import 'package:titik_merah/data/forum_data.dart';
import 'package:titik_merah/model/forum_model.dart';

class ForumService {
  final List<Forum> _forums = List.from(forumDummyData);

  List<Forum> getAllForums() => _forums;

  // Asynchronously fetch a forum by its ID
  Future<Forum?> getForumById(String id) async {
    await Future.delayed(Duration(milliseconds: 300));
    try {
      return _forums.firstWhere((forum) => forum.id == id);
    } catch (e) {
      return null;
    }
  }
}
