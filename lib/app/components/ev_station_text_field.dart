import 'package:ev_station/app/services/index.dart';
import 'package:ev_station/app/services/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EvStationTextField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final int maxLines;
  final bool? isObscure;
  final String? Function(String?)? validator;
  final bool? readOnly, isBorder;
  final int? maxLength;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? hintColor, textFillColor, borderColor;
  final TextInputType? textInputType;
  final void Function()? onTap;
  final double? radius, horizontal, borderWidth;
  final TextStyle? hintStyle;
  const EvStationTextField({
    Key? key,
    required this.hint,
    this.isObscure,
    this.maxLength,
    this.suffixIcon,
    this.textInputType,
    this.controller,
    this.textFillColor,
    this.maxLines = 1,
    this.prefixIcon,
    this.hintColor,
    this.validator,
    this.readOnly,
    this.onTap,
    this.radius,
    this.hintStyle,
    this.isBorder,
    this.horizontal,
    this.borderColor,
    this.borderWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EvStationRoundedBox(
      borderRadius: radius ?? 8.kh,
      isBorder: isBorder ?? false,
      borderWidth: borderWidth ?? 0.5.kh,
      borderColor: borderColor ?? const Color(0xff9F9F9F),
      child: TextFormField(
        onTap: onTap,
        readOnly: readOnly ?? false,
        validator: validator,
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxLength ?? -1),
        ],
        obscureText: isObscure ?? false,
        keyboardType: textInputType,
        maxLines: maxLines,
        style: TextStyleUtil.genSans400(fontSize: 16.kh, color: Colors.black),
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: horizontal ?? 24.kw, vertical: 12.kh),
          isDense: true,
          prefixIcon: prefixIcon,
          // prefixIconConstraints:
          //     BoxConstraints(minHeight: 24.kh, minWidth: 42.kh),
          suffixIconConstraints:
              BoxConstraints(maxHeight: 30.kh, maxWidth: 60.kw),
          suffixIcon: suffixIcon,
          hintText: hint,
          hintStyle: hintStyle ??
              TextStyleUtil.genSans400(
                  fontSize: 16.kh, color: hintColor ?? ColorUtil.hintText),
          fillColor: textFillColor ?? Colors.white,
          filled: true,
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(radius ?? 8.kh)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(radius ?? 8.kh)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(radius ?? 8.kh)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(radius ?? 8.kh)),
        ),
      ),
    );
  }
}
