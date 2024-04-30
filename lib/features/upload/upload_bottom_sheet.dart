// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:youtube_clone/cores/widgets/image_item.dart';

class CreateBottomSheet extends StatelessWidget {
  const CreateBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffFFFFFF),
      child: Padding(
        padding: const EdgeInsets.only(left: 7, top: 12),
        child: SizedBox(
          height: 270,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Create",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              SizedBox(
                height: 38,
                child: ImageItem(
                  itemText: "Create a Short",
                  itemClicked: () async {},
                  imageName: "short-video.png",
                  haveColor: true,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 38,
                child: ImageItem(
                  itemText: "Upload a Video",
                  itemClicked: () {},
                  imageName: "upload.png",
                  haveColor: true,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 38,
                child: ImageItem(
                  itemText: "Go Live",
                  itemClicked: () {},
                  imageName: "go-live.png",
                  haveColor: true,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 38,
                child: ImageItem(
                  itemText: "Create a post",
                  itemClicked: () {},
                  imageName: "create-post.png",
                  haveColor: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
