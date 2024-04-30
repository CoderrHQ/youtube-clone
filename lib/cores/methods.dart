// ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously

import 'package:flutter/material.dart';

void showErrorSnackBar(String message, context) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
