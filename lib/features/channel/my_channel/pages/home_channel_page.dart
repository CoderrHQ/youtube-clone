import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/cores/screens/error_page.dart';
import 'package:youtube_clone/cores/screens/loader.dart';
import 'package:youtube_clone/features/channel/users_channel/provider/channel_provider.dart';
import 'package:youtube_clone/features/content/Long_video/parts/post.dart';

class HomeChannelPage extends StatelessWidget {
  const HomeChannelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          return ref
              .watch(eachChannelVideosProvider(
                  FirebaseAuth.instance.currentUser!.uid))
              .when(
                data: (videos) => Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.sizeOf(context).height * 0.2,
                  ),
                  child: videos.length == 0
                      ? const Center(
                          child: Text(
                            "No Video",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : SizedBox(
                          height: 80,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 8.0,
                            ),
                            itemCount: videos.length,
                            itemBuilder: (context, index) {
                              if (videos.isNotEmpty) {
                                return Post(video: videos[index]);
                              }
                              return const SizedBox();
                            },
                          ),
                        ),
                ),
                error: (error, stackTrace) => const ErrorPage(),
                loading: () => const Loader(),
              );
        },
      ),
    );
  }
}
