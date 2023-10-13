import 'package:flutter/cupertino.dart';
import 'package:hackathon/common/utils/colors.dart';

class DecorationTemplates {
  static BoxShadow get messageBoxShadow {
    return BoxShadow(
      spreadRadius: 0.05,
      blurRadius: 0.1,
      offset: const Offset(1, 1),
      color: AppColors.black.withAlpha(52),
    );
  }

  static RoundedRectangleBorder get circular {
    return const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(16),
        topLeft: Radius.circular(16),
      ),
    );
  }
}
