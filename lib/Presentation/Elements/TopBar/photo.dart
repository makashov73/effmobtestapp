import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  final String userProfilePictureURL;
  const UserProfile({super.key, required this.userProfilePictureURL});

  @override
  Widget build(BuildContext context) {
    String url = userProfilePictureURL;
    return ClipOval(
      child: SizedBox.fromSize(
        size: const Size.fromRadius(22),
        child: Image.network(url, fit: BoxFit.cover),
      ),
    );
  }
}
