import 'package:assigment2/consts/fonts.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key,
    this.txt,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign
  }) : super(key: key);
  final String? txt;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign ,
      txt!,
     // textAlign: TextAlign.center,
      style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
          fontFamily: Fonts.openSansReg),
    );
  }
}
