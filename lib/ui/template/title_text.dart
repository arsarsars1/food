import 'package:flutter/material.dart';
import 'package:food/export.dart';

class TitleText extends StatelessWidget {
  final String? text;
  final double fontSize;
  final Color color;
  final int? maxLines;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  const TitleText(
      {Key? key,
      this.text,
      this.fontSize = 18,
      this.maxLines,
      this.textAlign = TextAlign.center,
      this.color = ColorsCustom.black,
      this.fontWeight = FontWeight.w700})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text ?? "",
        maxLines: maxLines,
        overflow: maxLines != null ? TextOverflow.ellipsis : null,
        textAlign: textAlign,
        style: TextStyle(
            fontSize: fontSize, fontWeight: fontWeight, color: color));
  }
}
