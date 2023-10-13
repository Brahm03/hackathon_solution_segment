import 'package:flutter/material.dart';
import 'package:hackathon/common/utils/font_style.dart';

import '../../../common/utils/colors.dart';

class Button extends StatefulWidget {
  final String title;
  final Function() onClick;
  final bool? loading;
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final Color? textColor;
  final Border? border;

  @override
  State<Button> createState() => _ButtonState();

  const Button({
    super.key,
    required this.title,
    required this.onClick,
    this.width,
    this.height = 52,
    this.margin,
    this.backgroundColor,
    this.textColor,
    this.border,
    this.loading = false,
  });
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.loading != true ? 1.0 : 0.5,
      child: Container(
        height: widget.height,
        width: widget.width,
        margin: widget.margin,
        decoration: BoxDecoration(
            border: widget.border, borderRadius: BorderRadius.circular(16)),
        child: Material(
          borderRadius: BorderRadius.circular(16),
          color: widget.border != null
              ? Colors.transparent
              : widget.backgroundColor ?? AppColors.primaryColor,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              widget.onClick.call();
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 6, right: 6),
              height: widget.height,
              child: widget.loading == false
                  ? Text(
                      widget.title,
                      style: getTextStyle(
                          size: 14,
                          color: widget.textColor ?? AppColors.white,
                          weight: FontWeight.bold),
                    )
                  : SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: widget.border != null
                            ? AppColors.primaryColor
                            : AppColors.white,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
