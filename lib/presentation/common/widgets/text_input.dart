import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackathon/common/utils/font_style.dart';
import '../../../common/assets.dart';
import '../../../common/utils/colors.dart';

class TextInput extends StatefulWidget {
  final String? hint;
  final String? prefixIcon;
  final String? suffixIcon;
  final bool autofocus;
  final TextInputType? textInputType;
  final bool obscureText;
  final bool passwordInput;
  final double? height;
  final double? width;
  final EdgeInsets? contentPadding;
  final double? borderRadius;
  final bool showBorder;
  final Color? containerBackgroundColor;
  final Function(String text)? onTextChanged;
  final int? maxLines;
  final EdgeInsets? margin;
  final bool showOutlinedBorder;
  final String? message;
  final bool error;
  final TextEditingController? controller;

  @override
  State<TextInput> createState() => _TextInputState();

  const TextInput({
    super.key,
    this.hint,
    this.prefixIcon,
    this.message,
    this.height,
    this.error = false,
    this.suffixIcon,
    this.textInputType,
    this.autofocus = false,
    this.obscureText = false,
    this.passwordInput = false,
    this.contentPadding,
    this.borderRadius,
    this.width,
    this.onTextChanged,
    this.maxLines = 1,
    this.showBorder = true,
    this.containerBackgroundColor,
    this.margin,
    this.showOutlinedBorder = false,
    this.controller,
  });
}

class _TextInputState extends State<TextInput> {
  bool obfuscate = false;
  bool isInputEmpty = true;

  @override
  void initState() {
    obfuscate = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 14),
          color: widget.containerBackgroundColor ?? AppColors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: widget.controller,
            autofocus: widget.autofocus,
            style: getTextStyle(
              size: 14,
            ),
            onChanged: (str) {
              widget.onTextChanged?.call(str);
              if (str.length == 1) {
                setState(() {
                  isInputEmpty = false;
                });
              }
              if (str.isEmpty) {
                setState(() {
                  isInputEmpty = true;
                });
              }
            },
            keyboardType: widget.textInputType,
            maxLines: widget.maxLines,
            obscureText: obfuscate,
            decoration: InputDecoration(
              border:
                  widget.showOutlinedBorder ? const OutlineInputBorder() : null,
              labelStyle: widget.showOutlinedBorder
                  ? getTextStyle(
                      color: widget.error ? AppColors.redLight : AppColors.greyHint)
                  : null,
              labelText: widget.showOutlinedBorder ? widget.hint : null,
              contentPadding: widget.contentPadding,
              filled: true,
              fillColor: widget.containerBackgroundColor ?? AppColors.white,
              prefixIcon: widget.prefixIcon != null
                  ? IconButton(
                      splashColor: Colors.transparent,
                      onPressed: () {
                        //
                      },
                      icon: SvgPicture.asset(widget.prefixIcon!),
                    )
                  : null,
              suffixIcon: !isInputEmpty
                  ? widget.passwordInput == true
                      ? IconButton(
                          splashColor: Colors.transparent,
                          onPressed: () {
                            setState(
                              () {
                                obfuscate = !obfuscate;
                              },
                            );
                          },
                          icon: obfuscate == true
                              ? SvgPicture.asset(
                                  Assets.eyeEnabledSvg,
                                  color: widget.error ? AppColors.redLight : null,
                                )
                              : SvgPicture.asset(
                                  Assets.eyeDisabledSvg,
                                  color: widget.error ? AppColors.redLight : null,
                                ),
                        )
                      : widget.suffixIcon != null
                          ? IconButton(
                              splashColor: Colors.transparent,
                              onPressed: () {
                                //
                              },
                              icon: SvgPicture.asset(widget.suffixIcon!),
                            )
                          : null
                  : null,
              hintText: widget.hint,
              hintStyle: getTextStyle(color: AppColors.greyHint),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color:
                        widget.error ? AppColors.redLight : AppColors.primaryColor,
                    width: widget.showBorder ? 1.5 : 0.001),
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 14),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppColors.greyHint,
                    width: widget.showBorder ? 1.5 : 0.001),
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 14),
              ),
            ),
          ),
          if (widget.message != null)
            Container(
              color: AppColors.transparent,
              margin: const EdgeInsets.only(top: 6, left: 12),
              child: Text(
                widget.message ?? "",
                style: getTextStyle(
                    color: widget.error ? AppColors.redLight : AppColors.greyHint),
              ),
            ),
        ],
      ),
    );
  }
}
