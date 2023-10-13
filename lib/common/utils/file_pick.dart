import 'package:file_picker/file_picker.dart';

class GFilePicker {
  static Future<PlatformFile?> pickSingle({FileType? fileType}) async {
    final res = (await _pick(false, fileType: fileType)) as PlatformFile?;
    return res;
  }

  static Future<List<PlatformFile>?> pickMultiple({FileType? fileType}) async {
    final res = (await _pick(true, fileType: fileType)) as List<PlatformFile>?;
    return res;
  }

  static Future<dynamic> _pick(bool multiple, {FileType? fileType}) async {
    final picker = await FilePicker.platform.pickFiles(
        allowMultiple: multiple == true, type: fileType ?? FileType.any);
    return multiple ? picker?.files : picker?.files.first;
  }
}
