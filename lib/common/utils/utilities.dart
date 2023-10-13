import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:encrypt_shared_preferences/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackathon/di/di/di_init.dart';
import 'dart:math';

import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';
import 'package:device_info_plus/device_info_plus.dart';


class Utilities {
  static Future<void> clearCache() async {
    await injector.get<EncryptedSharedPreferences>().clear();
  }

  static Future<String> deviceName() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final info = await deviceInfoPlugin.androidInfo;
      return info.brand;
    }
    final info = await deviceInfoPlugin.iosInfo;
    return info.name;
  }

  static void unFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static Future<String> encodeBytesToBaseBase64(Uint8List uint8list) async {
    return "data:image/jpeg;base64,${base64.encode(uint8list)}";
  }

  static void setStatusBarColorMode({bool dark = false}) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: dark ? Colors.grey[50] : Colors.black,
        statusBarIconBrightness: dark ? Brightness.dark : Brightness.light,
        statusBarBrightness: Brightness.light));
  }

  static void setNavigationColorMode({bool dark = false}) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: dark ? Colors.black : Colors.grey[50],
    ));
  }

  static bool get isKeyboardShowing =>
      WidgetsBinding.instance.window.viewInsets.bottom > 0.0;

  static String generateTag() {
    return "${DateTime.now().microsecondsSinceEpoch.toString()}tag";
  }

  static String uuid() {
    var uuid = const Uuid();
    return uuid.v4();
  }

  static String toMMCC({required int timeInSecond}) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute : $second";
  }

  static String getFileSizeString({required int bytes, int decimals = 0}) {
    const suffixes = ["B", "KB", "MB", "GB", "TB"];
    if (bytes == 0) return '0${suffixes[0]}';
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
  }

  static EventTransformer<Event> debounceTransformer<Event>(Duration duration) {
    return (events, mapper) {
      return events.debounceTime(duration).switchMap(mapper);
    };
  }
}

extension ContextExt on BuildContext {
  Size get screenSize {
    return MediaQuery.of(this).size;
  }
}

extension ScrollExt on ScrollController {
  bool get isOnBottom {
    bool isTop = position.pixels == 0;
    return !isTop;
  }
}
