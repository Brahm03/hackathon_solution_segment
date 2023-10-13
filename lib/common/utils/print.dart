import 'dart:async';
import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/common/utils/colors.dart';
import 'package:hackathon/common/utils/font_style.dart';

import 'package:path_provider/path_provider.dart';

void printMessage(dynamic message) {
  if (kDebugMode) {
    if (Platform.isAndroid) {
      final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
      pattern
          .allMatches(message.toString())
          .forEach((match) => print('\u001b[32m${match.group(0)}\u001b[0m'));
    } else {
      print(message.toString());
    }
  }
}

void logFile(dynamic message) async {
  final file =
      File("${(await getApplicationDocumentsDirectory()).path}/log.txt");
  if (file.existsSync()) {
    file.writeAsString(message.toString(), mode: FileMode.append);
  } else {
    file.create(recursive: true).then((value) async {
      file.writeAsString(message.toString(), mode: FileMode.append);
    });
  }
}

enum MessageStatus { success, fail, informative }

extension ContextExt on BuildContext {
  Future<void> showSnackBar(String? message,
      {MessageStatus status = MessageStatus.success}) async {
    if (message != null) {
      Color backColor = AppColors.black;

      if (status == MessageStatus.fail) {
        backColor = AppColors.redLight;
      }

      if (status == MessageStatus.informative) {
        backColor = AppColors.greyHint;
      }

      Flushbar(
        maxWidth: 400,
        padding: const EdgeInsets.all(24),
        flushbarPosition: FlushbarPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        messageSize: 16,
        icon: Icon(
          Icons.warning_amber_rounded,
          color: AppColors.white,
          size: 32,
        ),
        messageText: Text(
          message,
          style: getTextStyle(
              color: AppColors.white, size: 14, weight: FontWeight.w300),
        ),
        backgroundColor: backColor,
        borderRadius: BorderRadius.circular(16),
        margin: const EdgeInsets.all(12),
      ).show(this);
    }
  }
}
