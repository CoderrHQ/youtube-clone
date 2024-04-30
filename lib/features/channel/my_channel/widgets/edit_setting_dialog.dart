// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SettingsDialog extends StatefulWidget {
  final String identifier;
  final Function(String channelName)? onSave;
  const SettingsDialog({
    Key? key,
    required this.identifier,
    this.onSave,
  }) : super(key: key);

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.only(top: 0),
      title: Padding(
        padding: const EdgeInsets.only(left: 22, top: 8),
        child: Text(
          widget.identifier,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ),
      content: SizedBox(
        height: 50,
        child: TextField(
          controller: controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "CANCEL",
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () {
            widget.onSave!(controller.text);
          },
          child: const Text(
            "SAVE",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
