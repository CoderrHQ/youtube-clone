// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/cores/widgets/flat_button.dart';
import 'package:youtube_clone/features/upload/short_video/repository/short_video_repository.dart';

class ShortVideoDetailsPage extends ConsumerStatefulWidget {
  final File video;
  const ShortVideoDetailsPage({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  ConsumerState<ShortVideoDetailsPage> createState() =>
      _ShortVideoDetailsPageState();
}

class _ShortVideoDetailsPageState extends ConsumerState<ShortVideoDetailsPage> {
  final captionController = TextEditingController();
  final DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Video Details",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: captionController,
                decoration: const InputDecoration(
                  hintText: "Write a caption...",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: FlatButton(
                  text: "PUBLISH",
                  onPressed: () async {
                    await ref
                        .watch(shortVideoProvider)
                        .addShortVideoToFirestore(
                          caption: captionController.text,
                          video: widget.video.path,
                          datePublished: date,
                        );
                  },
                  colour: Colors.green,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
