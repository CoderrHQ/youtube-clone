// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/features/upload/comments/comment_model.dart';

class CommentTile extends StatelessWidget {
  final CommentModel comment;
  const CommentTile({
    Key? key,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 7),
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.grey,
                  backgroundImage:
                      CachedNetworkImageProvider(comment.profilePic),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                comment.displayName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              const Text(
                "a moment ago",
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),
              const Spacer(),
              const Icon(Icons.more_vert),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              right: MediaQuery.sizeOf(context).width * 0.56,
            ),
            child: Text(comment.commentText),
          ),
        ],
      ),
    );
  }
}
