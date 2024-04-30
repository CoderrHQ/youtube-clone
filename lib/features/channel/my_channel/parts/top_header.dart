// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:youtube_clone/features/auth/model/user_model.dart';

class TopHeader extends StatelessWidget {
  final UserModel user;
  const TopHeader({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CircleAvatar(
            radius: 38,
            backgroundColor: Colors.grey,
            backgroundImage: CachedNetworkImageProvider(user.profilePic),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 4),
          child: Text(
            user.displayName,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 9),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                color: Colors.blueGrey,
              ),
              children: [
                TextSpan(text: "@${user.username}  "),
                TextSpan(
                  text: user.subscriptions.isEmpty
                      ? "No subscription  "
                      : "${user.subscriptions.length} subscriptions ",
                ),
                TextSpan(
                  text: user.videos == 0 ? "No video" : "${user.videos} videos",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
