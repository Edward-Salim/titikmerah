import 'package:flutter/material.dart';
import 'package:titik_merah/model/forum_model.dart';
import 'package:titik_merah/model/forum_thread_model.dart';
import 'package:titik_merah/services/forum_thread_service.dart';
import 'package:titik_merah/widgets/quick_report/institution/forum_thread_widget.dart';

class ForumWidget extends StatelessWidget {
  final Forum forum; // Forum data passed from HomeScreen
  final ForumThreadService _threadService = ForumThreadService();

  ForumWidget({required this.forum});

  // Fetch threads using ForumThreadService for each threadId in the Forum
  Future<List<ForumThread>> _fetchThreads() async {
    // Use Future.wait to fetch all threads concurrently
    List<ForumThread?> threads = await Future.wait(
      forum.threadIds.map(
        (threadId) => _threadService.getThreadById(threadId),
      ),
    );
    // Filter out any null values and return the list
    return threads.whereType<ForumThread>().toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "💬 Forum Diskusi",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () {
                  // TODO: Add navigation to view all forum threads
                },
                child: Text(
                  "Lihat Semua >",
                  style: TextStyle(fontSize: 12, color: Colors.lightBlueAccent),
                ),
              ),
            ],
          ),
          SizedBox(height: 6),

          // Fetch and display threads using FutureBuilder
          FutureBuilder<List<ForumThread>>(
            future: _fetchThreads(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                    child: Text("Error loading threads",
                        style: TextStyle(color: Colors.white)));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                    child: Text("No threads available",
                        style: TextStyle(color: Colors.white)));
              }

              final threads = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: threads
                    .map((thread) => ForumThreadWidget(thread: thread))
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
