// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/features/account/items.dart';
import 'package:youtube_clone/features/auth/model/user_model.dart';
import 'package:youtube_clone/features/channel/my_channel/pages/my_channel_screen.dart';

class AccountPage extends StatelessWidget {
  final UserModel user;
  const AccountPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10, bottom: 30),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey,
                        backgroundImage: CachedNetworkImageProvider(
                          user.profilePic,
                        ),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyChannelScreen(),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                user.displayName,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Text(
                                "@${user.username}",
                                style: const TextStyle(
                                  fontSize: 13.5,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ),
                            const Text(
                              "Manage Your Google Account",
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Items(),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: Text(
                    "Privacy Policy . Terms of Services",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 13.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
