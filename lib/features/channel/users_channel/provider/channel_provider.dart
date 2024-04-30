import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/features/upload/long_video/video_model.dart';

final eachChannelVideosProvider = FutureProvider.family((ref, userId) async {
  final videosMap = await FirebaseFirestore.instance
      .collection("videos")
      .where("userId", isEqualTo: userId)
      .get();

  final videos = videosMap.docs;
  final List<VideoModel> videoModels =
      videos.map((video) => VideoModel.fromMap(video.data())).toList();
  return videoModels;
});
