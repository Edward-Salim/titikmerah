import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:titik_merah/model/forum_comment_model.dart';
import 'package:titik_merah/model/profile_model.dart';
import 'package:titik_merah/services/profile_service.dart';
import 'package:titik_merah/widgets/common/profile_avatar.dart';

/// A widget to display an individual forum comment.
/// It fetches the commenter's profile details using the ProfileService.
class ForumCommentWidget extends StatelessWidget {
  final ForumComment comment;
  final ProfileService _profileService = ProfileService();

  ForumCommentWidget({required this.comment});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Profile?>(
      future: _profileService.getProfileById(comment.profileId),
      builder: (context, snapshot) {
        String profileName = "Unknown";
        String? phoneNumber;
        if (snapshot.connectionState == ConnectionState.waiting) {
          profileName = "Loading...";
        } else if (snapshot.hasData && snapshot.data != null) {
          profileName = snapshot.data!.name;
          phoneNumber = snapshot.data!.phoneNumber; // Assumes Profile has a phoneNumber field.
        }
        return Container(
          margin: EdgeInsets.symmetric(vertical: 4),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Use ProfileAvatar for the profile icon.
              ProfileAvatar(
                phoneNumber: phoneNumber,
                size: 32, // Adjust size to fit your design.
              ),
              SizedBox(width: 8),
              // Comment details: profile name, text, and time.
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profileName,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      comment.text,
                      style: TextStyle(fontSize: 14, color: Colors.white70),
                    ),
                    SizedBox(height: 4),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        comment.time,
                        style: TextStyle(fontSize: 12, color: Colors.white54),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
