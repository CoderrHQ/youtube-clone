import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/cores/screens/error_page.dart';
import 'package:youtube_clone/cores/screens/loader.dart';
import 'package:youtube_clone/features/content/short_video/widgets/short_video_tile.dart';
import 'package:youtube_clone/features/upload/short_video/model/short_video_model.dart';

class ShortVideoPage extends StatelessWidget {
  const ShortVideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("shorts").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.data == null || !snapshot.hasData) {
                return const ErrorPage();
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Loader();
              }
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final shortVideoMaps = snapshot.data!.docs;
                  ShortVideoModel shortVideo =
                      ShortVideoModel.fromMap(shortVideoMaps[index].data());
                  return ShortVideoTile(
                    shortVideo: shortVideo,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
