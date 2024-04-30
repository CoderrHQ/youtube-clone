// ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:youtube_clone/features/upload/long_video/video_details_page.dart';
import 'package:youtube_clone/features/upload/short_video/pages/short_video_screen.dart';

void showErrorSnackBar(String message, context) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );

Future pickVideo(context) async {
  XFile? file = await ImagePicker().pickVideo(source: ImageSource.gallery);
  File video = File(file!.path);
  Navigator.push(context, MaterialPageRoute(
    builder: (context) {
      return VideoDetailsPage(video: video);
    },
  ));
}

Future pickShortVideo(context) async {
  XFile? file = await ImagePicker().pickVideo(source: ImageSource.gallery);
  File video = File(file!.path);
  Navigator.push(context, MaterialPageRoute(
    builder: (context) {
      return ShortVideoScreen(
        shortVideo: video,
      );
    },
  ));
}

Future<File> pickImage() async {
  XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
  File image = File(file!.path);
  return image;
}

Future<String> putFileInStorage(file, number, fileType) async {
  final ref = FirebaseStorage.instance.ref().child("$fileType/$number");
  final upload = ref.putFile(file);
  final snapshot = await upload;
  String downloadUrl = await snapshot.ref.getDownloadURL();
  return downloadUrl;
}
