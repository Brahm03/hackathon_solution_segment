class StringUtils {
  static String makeImageName(String text) {
    String result = "";
    final split = text.split(" ");
    if (split.length > 1) {
      result = "${split[0][0]}${split[1][0]}";
    } else {
      //
    }
    return result;
  }

}

extension StringExt on String {
  bool get isUrl => startsWith("https://") || startsWith("http://");

      String get clearBase64 {
    return replaceAll("data:image/jpeg;base64,", "");
  }
}
