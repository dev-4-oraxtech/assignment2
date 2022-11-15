import 'package:flutter/material.dart';
import '../../consts/app_colors_strings.dart';
import '../../consts/fonts.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.textController,
    this.inputType,
    this.hint,
    this.isObscure = false,
    this.padding = const EdgeInsets.all(0),
    this.hintColor = AppColors.txtColorWhite,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.autoFocus = false,
    this.inputAction,
    this.validator,
    this.onEditingComplete,
    this.suffix,
    this.prefix,
    this.readOnly = false,
    this.onTap,
    this.maxLines = 1,
  }) : super(key: key);

  final String? hint;
  final bool isObscure;
  final TextInputType? inputType;
  final TextEditingController textController;
  final EdgeInsets padding;
  final Color hintColor;
  final FocusNode? focusNode;
  final ValueChanged? onFieldSubmitted;
  final ValueChanged? onChanged;
  final bool autoFocus;
  final TextInputAction? inputAction;
  final String? Function(String?)? validator;
  final VoidCallback? onEditingComplete;
  final Widget? suffix;
  final Widget? prefix;
  final bool? readOnly;
  final VoidCallback? onTap;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      autofocus: autoFocus,
      validator: validator,
      textInputAction: inputAction,
      obscureText: isObscure,
      maxLines: maxLines,
      onTap: onTap,
      readOnly: readOnly!,
      keyboardType: inputType,
      style: const TextStyle(color: AppColors.txtColorWhite),
      decoration: InputDecoration(
          fillColor: AppColors.textFieldColor,
          filled: true,
          hintText: hint,
          hintStyle: const TextStyle(
            color: AppColors.txtColorWhite,
            fontFamily: Fonts.openSansReg,
            fontWeight: FontWeight.w400,
          ),
          errorStyle: const TextStyle(color: Colors.red),
          border: InputBorder.none,
          focusedBorder: focusedBorder,
          enabledBorder: enabledBorder,
          errorBorder: errorBorder,
          errorMaxLines: 3,
          focusedErrorBorder: focusedErrorBorder,
          suffixIcon: suffix == null
              ? null
              : Container(
                  width: 30,
                  padding: const EdgeInsets.only(right: 10.0),
                  alignment: Alignment.center,
                  child: suffix,
                ),
          prefixIcon: prefix == null
              ? null
              : Container(
                  width: 30,
                  padding: const EdgeInsets.only(left: 10.0),
                  alignment: Alignment.centerLeft,
                  child: prefix,
                )),
    );
  }

  OutlineInputBorder get enabledBorder => OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.textFieldColor
    ),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      );

  OutlineInputBorder get disabledBorder => const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      );

  OutlineInputBorder get focusedBorder => const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.inActiveDotColor,
          width: 1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      );
  OutlineInputBorder get errorBorder => const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
          width: 1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      );

  OutlineInputBorder get focusedErrorBorder => const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      );
}
