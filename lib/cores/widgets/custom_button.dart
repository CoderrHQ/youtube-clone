// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onTap;
  final bool haveColor;
  const CustomButton({
    Key? key,
    required this.iconData,
    required this.onTap,
    required this.haveColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 9, right: 4),
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: haveColor
            ? const BoxDecoration(
                color: Color(0xffF2F2F2),
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              )
            : null,
        child: InkWell(
          onTap: onTap,
          child: Icon(
            iconData,
            size: 19,
          ),
        ),
      ),
    );
  }
}
