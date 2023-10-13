import 'package:flutter/material.dart';

bool darkMode = false;

class AppColors {
  static Color get blue => Colors.blue;

  AppColors._();

  static Color get primaryColor {
    if (darkMode) {
      return const Color(0xFF000000);
    } else {
      return const Color(0xFF3F8AE0);
    }
  }

  static Color get materialColor => const Color(0xFFEFEFEF);

  static Color get white => const Color(0xFFFFFFFF);

  static Color get black => const Color(0xFF000000);

  static Color get transparent => const Color(0x00000000);

  static Color get green => const Color(0xFF1EA009);

  static Color get greenLight => const Color(0xffCCE4FF);

  static Color get greenLightBorder => const Color(0xFFA4D19D);

  static Color get orange => const Color(0xFFF98600);

  static Color get redLight => const Color(0xffc65159);

  static Color get red => const Color(0xffff0013);

  static Color get greyLight => const Color(0xFF738694);

  static Color get greyHint => const Color(0xFFBFCCD6);

  static Color get grey => const Color(0xFF818C99);
}

extension ColorNameToColor on String? {
  static Map<String, String> colorNames = {
    "AliceBlue": "f0f8ff",
    "AntiqueWhite": "faebd7",
    "Aqua/Cyan": "00ffff",
    "Aquamarine": "7fffd4",
    "Azure": "f0ffff",
    "Beige": "f5f5dc",
    "Bisque": "ffe4c4",
    "Black": "000000",
    "BlanchedAlmond": "ffebcd",
    "Blue": "0000ff",
    "BlueViolet": "8a2be2",
    "Brown": "a52a2a",
    "BurlyWood": "deb887",
    "CadetBlue": "5f9ea0",
    "Chartreuse": "7fff00",
    "Chocolate": "d2691e",
    "Coral": "ff7f50",
    "CornflowerBlue": "6495ed",
    "Cornsilk": "fff8dc",
    "Crimson": "dc143c",
    "DarkBlue": "00008b",
    "DarkCyan": "008b8b",
    "DarkGoldenRod": "b8860b",
    "DarkGray/DarkGrey": "a9a9a9",
    "DarkGreen": "006400",
    "DarkKhaki": "bdb76b",
    "DarkMagenta": "8b008b",
    "DarkOliveGreen": "556b2f",
    "DarkOrange": "ff8c00",
    "DarkOrchid": "9932cc",
    "DarkRed": "8b0000",
    "DarkSalmon": "e9967a",
    "DarkSeaGreen": "8fbc8f",
    "DarkSlateBlue": "483d8b",
    "DarkSlateGray/DarkSlateGrey": "2f4f4f",
    "DarkTurquoise": "00ced1",
    "DarkViolet": "9400d3",
    "DeepPink": "ff1493",
    "DeepSkyBlue": "00bfff",
    "DimGray/DimGrey": "696969",
    "DodgerBlue": "1e90ff",
    "FireBrick": "b22222",
    "FloralWhite": "fffaf0",
    "ForestGreen": "228b22",
    "Fuchsia/Magenta": "ff00ff",
    "Gainsboro": "dcdcdc",
    "GhostWhite": "f8f8ff",
    "Gold": "ffd700",
    "GoldenRod": "daa520",
    "Gray/Grey": "808080",
    "Green": "008000",
    "GreenYellow": "adff2f",
    "HoneyDew": "f0fff0",
    "HotPink": "ff69b4",
    "IndianRed": "cd5c5c",
    "Indigo": "4b0082",
    "Ivory": "fffff0",
    "Khaki": "f0e68c",
    "Lavender": "e6e6fa",
    "LavenderBlush": "fff0f5",
    "LawnGreen": "7cfc00",
    "LemonChiffon": "fffacd",
    "LightBlue": "add8e6",
    "LightCoral": "f08080",
    "LightCyan": "e0ffff",
    "LightGoldenRodYellow": "fafad2",
    "LightGray/LightGrey": "d3d3d3",
    "LightGreen": "90ee90",
    "LightPink": "ffb6c1",
    "LightSalmon": "ffa07a",
    "LightSeaGreen": "20b2aa",
    "LightSkyBlue": "87cefa",
    "LightSlateGray/LightSlateGrey": "778899",
    "LightSteelBlue": "b0c4de",
    "LightYellow": "ffffe0",
    "Lime": "00ff00",
    "LimeGreen": "32cd32",
    "Linen": "faf0e6",
    "Maroon": "800000",
    "MediumAquaMarine": "66cdaa",
    "MediumBlue": "0000cd",
    "MediumOrchid": "ba55d3",
    "MediumPurple": "9370db",
    "MediumSeaGreen": "3cb371",
    "MediumSlateBlue": "7b68ee",
    "MediumSpringGreen": "00fa9a",
    "MediumTurquoise": "48d1cc",
    "MediumVioletRed": "c71585",
    "MidnightBlue": "191970",
    "MintCream": "f5fffa",
    "MistyRose": "ffe4e1",
    "Moccasin": "ffe4b5",
    "NavajoWhite": "ffdead",
    "Navy": "000080",
    "OldLace": "fdf5e6",
    "Olive": "808000",
    "OliveDrab": "6b8e23",
    "Orange": "ffa500",
    "OrangeRed": "ff4500",
    "Orchid": "da70d6",
    "PaleGoldenRod": "eee8aa",
    "PaleGreen": "98fb98",
    "PaleTurquoise": "afeeee",
    "PaleVioletRed": "db7093",
    "PapayaWhip": "ffefd5",
    "PeachPuff": "ffdab9",
    "Peru": "cd853f",
    "Pink": "ffc0cb",
    "Plum": "dda0dd",
    "PowderBlue": "b0e0e6",
    "Purple": "800080",
    "RebeccaPurple": "663399",
    "Red": "ff0000",
    "RosyBrown": "bc8f8f",
    "RoyalBlue": "4169e1",
    "SaddleBrown": "8b4513",
    "Salmon": "fa8072",
    "SandyBrown": "f4a460",
    "SeaGreen": "2e8b57",
    "SeaShell": "fff5ee",
    "Sienna": "a0522d",
    "Silver": "c0c0c0",
    "SkyBlue": "87ceeb",
    "SlateBlue": "6a5acd",
    "SlateGray/SlateGrey": "708090",
    "Snow": "fffafa",
    "SpringGreen": "00ff7f",
    "SteelBlue": "4682b4",
    "Tan": "d2b48c",
    "Teal": "008080",
    "Thistle": "d8bfd8",
    "Tomato": "ff6347",
    "Turquoise": "40e0d0",
    "Violet": "ee82ee",
    "Wheat": "f5deb3",
    "White": "ffffff",
    "WhiteSmoke": "f5f5f5",
    "Yellow": "ffff00",
    "YellowGreen": "9acd32",
  };

  Color get parseFromColorName {
    Color color = AppColors.primaryColor;
    colorNames.forEach((key, value) {
      if (key.toLowerCase() == this?.toLowerCase()) {
        color = HexColor.fromHex(
            colorNames[key] ?? colorNames[colorNames.keys.first]!);
      }
    });
    return color;
  }
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
