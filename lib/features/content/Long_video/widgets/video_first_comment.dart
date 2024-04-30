// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class VideoFirstComment extends StatelessWidget {
  const VideoFirstComment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              "Comments",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 5),
            Text("${0}"),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 7.5),
          child: Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: Colors.grey,
              ),
              const SizedBox(width: 7),
              SizedBox(
                width: 280,
                child: Text(
                  "First comment on the video",
                  maxLines: 2,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
