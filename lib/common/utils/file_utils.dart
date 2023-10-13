import 'dart:convert';
import 'dart:io';

import 'package:hackathon/common/utils/mocks.dart';
import 'package:hackathon/common/utils/print.dart';
import 'package:path_provider/path_provider.dart';

class FileUtils {
  static late String privatePath;

  static Future<void> init() async {
    privatePath = (await getApplicationDocumentsDirectory()).path;
  }

  static String getFileCategory(String extension) {
    printMessage("GET FILE CATEGORY BY EXT : ${extension}");
    switch (extension) {
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
        return 'Photo';

      case 'mp4':
      case 'avi':
      case 'mkv':
        return 'Video';

      case 'mp3':
      case 'wav':
      case 'flac':
        return 'Audio';

      default:
        return 'File';
    }
  }

  static String decodeFromBase64(String base64String, int size,
      {required String fileName}) {
    fileName = fileName.split(".")[0];
    if(base64String.trim().isEmpty) base64String = Mocks.base64PlaceHolder;
    final file = File("$privatePath/$fileName$size.jpeg");
    if (file.existsSync()) {
      return file.path;
    } else {
      final bytes =
          base64.decode(base64String.replaceAll("data:image/jpeg;base64,", ""));
      file.createSync();
      file.writeAsBytesSync(bytes);
      return file.path;
    }
  }
}
