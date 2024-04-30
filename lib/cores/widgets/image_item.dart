// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  final String itemText;
  final VoidCallback itemClicked;
  final String imageName;
  final bool? haveColor;
  const ImageItem({
    Key? key,
    required this.itemText,
    required this.itemClicked,
    required this.imageName,
    this.haveColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: itemClicked,
      child: Padding(
        padding: const EdgeInsets.only(left: 7),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(25),
                ),
                color: haveColor! ? const Color(0xffF2F2F2) : null,
              ),
              child: GestureDetector(
                onTap: itemClicked,
                child: Image.asset(
                  "assets/icons/$imageName",
                ),
              ),
            ),
            const SizedBox(width: 6),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                itemText,
                style: const TextStyle(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
