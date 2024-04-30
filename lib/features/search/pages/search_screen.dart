import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/cores/widgets/custom_button.dart';
import 'package:youtube_clone/features/auth/model/user_model.dart';
import 'package:youtube_clone/features/content/Long_video/parts/post.dart';
import 'package:youtube_clone/features/search/providers/search_providers.dart';
import 'package:youtube_clone/features/search/widgets/search_channel_tile_widget.dart';
import 'package:youtube_clone/features/upload/long_video/video_model.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  List foundItems = [];

  Future<void> filterList(String keywordSelected) async {
    List<UserModel> users = await ref.watch(allChannelsProvider);

    List result = [];

    final foundChannels = users.where((user) {
      return user.displayName
          .toString()
          .toLowerCase()
          .contains(keywordSelected);
    }).toList();

    result.addAll(foundChannels);

    final List<VideoModel> videos = await ref.watch(allVideosProvider);

    final foundVideos = videos.where((video) {
      return video.title.toString().toLowerCase().contains(keywordSelected);
    }).toList();

    result.addAll(foundVideos);

    setState(() {
      result.shuffle();
      foundItems = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  SizedBox(
                    height: 43,
                    width: 279,
                    child: TextFormField(
                      onChanged: (value) async {
                        await filterList(value);
                      },
                      decoration: InputDecoration(
                        hintText: "Search You Tube...",
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(18),
                          ),
                          borderSide: BorderSide(
                            color: Colors.grey.shade200,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(18),
                          ),
                          borderSide: BorderSide(
                            color: Colors.grey.shade200,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(18),
                          ),
                          borderSide: BorderSide(
                            color: Colors.grey.shade200,
                          ),
                        ),
                        filled: true,
                        fillColor: const Color(0xfff2f2f2),
                        contentPadding: const EdgeInsets.only(
                          left: 13,
                          bottom: 12,
                        ),
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 43,
                    width: 55,
                    child: CustomButton(
                      iconData: Icons.search,
                      onTap: () {},
                      haveColor: true,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: foundItems.length,
                  itemBuilder: (context, index) {
                    List<Widget> itemsWigdets = [];
                    final selectedItem = foundItems[index];

                    if (selectedItem.type == "video") {
                      itemsWigdets.add(
                        Post(video: selectedItem),
                      );
                    }
                    if (selectedItem.type == "user") {
                      itemsWigdets.add(
                        SearchChannelTile(
                          user: selectedItem,
                        ),
                      );
                    }
                    if (foundItems.isEmpty) {
                      return const SizedBox();
                    }

                    return itemsWigdets[0];
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
