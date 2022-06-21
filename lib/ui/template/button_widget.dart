import 'package:flutter/material.dart';
import 'package:food/export.dart';

class ButtonWidget extends StatelessWidget {
  final double radius;
  final bool isSelected;
  final String? text;
  final Widget? child;
  final Color? color;
  final Color? textColor;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final GestureTapCallback? onTap;
  const ButtonWidget(
      {Key? key,
      this.radius = 10,
      this.isSelected = false,
      this.child,
      this.text,
      this.color,
      this.textColor,
      this.margin = EdgeInsets.zero,
      this.padding = const EdgeInsets.all(8),
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color ?? (isSelected ? Colors.amber : Colors.white),
        ),
        margin: margin,
        padding: padding,
        child: child ??
            (text != null
                ? TitleText(
                    text: text,
                    fontWeight: isSelected ? FontWeight.w800 : FontWeight.w300,
                    fontSize: isSelected ? 18 : 17,
                    color: textColor ?? ColorsCustom.black)
                : const SizedBox()),
      ),
    );
  }
}
