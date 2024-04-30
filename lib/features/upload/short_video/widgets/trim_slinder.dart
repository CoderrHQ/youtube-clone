// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:video_editor/video_editor.dart';

String formatter(Duration duration) => [
      duration.inMinutes.remainder(60).toString().padLeft(2, '0'),
      duration.inSeconds.remainder(60).toString().padLeft(2, '0'),
    ].join(":");

class MyTrimSlider extends StatefulWidget {
  final VideoEditorController controller;
  final double height;

  const MyTrimSlider({
    Key? key,
    required this.controller,
    required this.height,
  }) : super(key: key);

  @override
  State<MyTrimSlider> createState() => _MyTrimSliderState();
}

class _MyTrimSliderState extends State<MyTrimSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: Listenable.merge(
            [widget.controller.video],
          ),
          builder: (context, child) {
            final int duration = widget.controller.videoDuration.inSeconds;
            final double pos = widget.controller.trimPosition * duration;
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: widget.height / 4,
              ),
              child: Row(
                children: [
                  Text(
                    formatter(
                      Duration(
                        seconds: pos.toInt(),
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(vertical: widget.height / 4),
          child: TrimSlider(
            controller: widget.controller,
            height: widget.height,
            horizontalMargin: widget.height / 4,
            child: TrimTimeline(
              controller: widget.controller,
              padding: const EdgeInsets.only(top: 10),
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
