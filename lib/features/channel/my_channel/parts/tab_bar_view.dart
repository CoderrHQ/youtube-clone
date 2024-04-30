import 'package:flutter/material.dart';
import 'package:youtube_clone/features/channel/my_channel/pages/home_channel_page.dart';

class TabPages extends StatelessWidget {
  const TabPages({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: TabBarView(
        children: [
          HomeChannelPage(),
          Center(
            child: Text("Videos"),
          ),
          Center(
            child: Text("shorts"),
          ),
          Center(
            child: Text("community"),
          ),
          Center(
            child: Text("playlists"),
          ),
          Center(
            child: Text("channel"),
          ),
          Center(
            child: Text("about"),
          ),
        ],
      ),
    );
  }
}
