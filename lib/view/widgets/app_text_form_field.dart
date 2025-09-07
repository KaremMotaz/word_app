import 'package:flutter/material.dart';
import 'package:hive_app/view/styles/color_manager.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.controller,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    required this.hintText,
    this.suffixIcon,
    this.backgroundColor,
    this.isObscureText,
    this.textStyle,
    required this.validator,
    required this.onChanged,
    this.textInputType,
    required this.label,
  });
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final String? hintText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final bool? isObscureText;
  final TextStyle? textStyle;
  final Function(String?) validator;
  final void Function(String)? onChanged;
  final TextInputType? textInputType;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      cursorColor: ColorManager.white,
      keyboardType: textInputType ?? TextInputType.name,
      controller: controller,
      minLines: 1,
      maxLines: 2,
      decoration: InputDecoration(
        label: Text(label, style: TextStyle(color: ColorManager.white)),
        isDense: true,
        contentPadding:
            contentPadding ??
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        focusedBorder:
            focusedBorder ??
            buildOutLineInputBorder(borderColor: ColorManager.white),
        enabledBorder:
            enabledBorder ??
            buildOutLineInputBorder(borderColor: ColorManager.white),
        errorBorder: buildOutLineInputBorder(borderColor: Colors.red),
        focusedErrorBorder: buildOutLineInputBorder(borderColor: Colors.red),
        hintStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: ColorManager.white,
        ),
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: backgroundColor,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style:
          textStyle ??
          TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: ColorManager.white,
          ),
      validator: (value) {
        return validator(value);
      },
      onChanged: onChanged,
    );
  }
}

OutlineInputBorder buildOutLineInputBorder({required Color borderColor}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: borderColor, width: 2),
    borderRadius: BorderRadius.circular(16),
  );
}
