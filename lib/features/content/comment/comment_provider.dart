import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/features/upload/comments/comment_model.dart';

final commentsProvider = FutureProvider.family((ref, videoId) async {
  final commentsMap = await FirebaseFirestore.instance
      .collection("comments")
      .where("videoId", isEqualTo: videoId)
      .get();

  final List<CommentModel> comments = commentsMap.docs
      .map(
        (comment) => CommentModel.fromMap(
          comment.data(),
        ),
      )
      .toList();

  return comments;
});
