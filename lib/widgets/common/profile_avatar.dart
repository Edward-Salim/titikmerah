import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProfileAvatar extends StatelessWidget {
  /// If [phoneNumber] is not null (and not empty), this avatar is considered verified.
  final String? phoneNumber;

  /// Size of the avatar (width and height).
  final double size;

  const ProfileAvatar({
    Key? key,
    this.phoneNumber,
    this.size = 40.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isVerified = phoneNumber != null && phoneNumber!.trim().isNotEmpty;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Base avatar container.
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.3),
            border: isVerified ? Border.all(color: Colors.blue, width: 2.0) : null,
          ),
          child: Center(
            child: Icon(
              CupertinoIcons.person_solid,
              size: size * 0.55,
              color: Colors.white,
            ),
          ),
        ),
        // If verified, show a check badge at the top-right.
        if (isVerified)
          Positioned(
            bottom: -4,
            right: -4,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                size: 12,
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }
}
