import 'package:flutter/cupertino.dart';

extension NavigatorCustom<T> on BuildContext {
  Future<dynamic> navigateTo(Widget widget,
      {bool removeStack = false, Function(dynamic)? onResultBack}) async {
    if (removeStack) {
      final res = await Navigator.of(this).pushAndRemoveUntil(
          CupertinoPageRoute(builder: (context) => widget),
          (Route<dynamic> route) => false);
      onResultBack?.call(res);
    } else {
      final res = await Navigator.push(
        this,
        CupertinoPageRoute(builder: (context) => widget),
      );
      onResultBack?.call(res);
    }
  }

  Future<dynamic> showAsDialog(Widget widget) async {
    Navigator.of(this).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        pageBuilder: (BuildContext context, _, __) {
          return widget;
        },
      ),
    );
  }

  void goBack({dynamic data}) {
    Navigator.pop(this, data);
  }
}
