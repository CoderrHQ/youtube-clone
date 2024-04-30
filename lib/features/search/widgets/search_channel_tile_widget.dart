// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:youtube_clone/cores/widgets/flat_button.dart';
import 'package:youtube_clone/features/auth/model/user_model.dart';
import 'package:youtube_clone/features/channel/users_channel/pages/user_channel_page.dart';
import 'package:youtube_clone/features/channel/users_channel/subscribe_respository.dart';

class SearchChannelTile extends ConsumerWidget {
  final UserModel user;
  const SearchChannelTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserChannelPage(
                userId: user.userId,
              ),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey,
              backgroundImage: CachedNetworkImageProvider(user.profilePic),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.displayName,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "@${user.username}",
                    style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    user.subscriptions.isEmpty
                        ? "No subscription"
                        : "${user.subscriptions.length} subscriptions",
                    style: const TextStyle(
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 40,
                    width: 110,
                    child: FlatButton(
                      text: "Subscribe",
                      onPressed: () async {
                        await ref
                            .watch(subscribeChannelProvider)
                            .subscribeChannel(
                              userId: user.userId,
                              currentUserId:
                                  FirebaseAuth.instance.currentUser!.uid,
                              subscriptions: user.subscriptions,
                            );
                      },
                      colour: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
